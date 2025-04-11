import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../core.dart';

class ApiService extends GetxService {
  SharedPreferences sharedPreferences;
  ApiService({required this.sharedPreferences});
  
  Future<ResponseModel> request(
      String uri, String method, Map<String, dynamic>? params,
      {bool passHeader = false}) async {
    Uri url = Uri.parse(uri);
    http.Response response;

    try {
      if (method == Method.postMethod) {
        if (passHeader) {
          initToken();
          response = await http.post(
            url,
            body: params,
            headers: {
              'Accept': 'application/json',
              'Authorization': token,
            },
          );
        } else {
          response = await http.post(
            url,
            body: params,
          );
        }
      } else if (method == Method.putMethod) {
        initToken();
        response = await http.put(
          url,
          body: params,
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
            'Accept': 'application/json',
            'Authorization': token,
          },
        );
      } else if (method == Method.deleteMethod) {
        initToken();
        response = await http.delete(
          url,
          headers: {
            'Accept': 'application/json',
            'Authorization': token,
          },
        );
      } else {
        if (passHeader) {
          initToken();
          response = await http.get(url, headers: {
            'Accept': 'application/json',
            'Authorization': token,
          });
        } else {
          response = await http.get(url);
        }
      }

      if (kDebugMode) {
        print('====> url: ${uri.toString()}');
        print('====> method: $method');
        print('====> params: ${params.toString()}');
        print('====> status: ${response.statusCode}');
        print('====> body: ${response.body.toString()}');
        print('====> token: $token');
      }

      StatusModel model = StatusModel.fromJson(
        jsonDecode(
          response.body,
        ),
      );

      if (response.statusCode == 200) {
        try {
          if (!model.status!) {
            sharedPreferences.setBool(
                SharedPreferenceHelper.accessTokenKey, false);
            sharedPreferences
                .remove(SharedPreferenceHelper.token); //when lose token
            Get.offAllNamed(RouteHelper.loginScreen);
          }
        } catch (e) {
          e.toString();
        }
        return ResponseModel(true, model.message!.tr, response.body);
      } else if (response.statusCode == 401) {
        //when token expired
        sharedPreferences.setBool(SharedPreferenceHelper.rememberMeKey, false);
        Get.offAllNamed(RouteHelper.loginScreen);
        return ResponseModel(false, model.message!.tr, response.body);
      } else if (response.statusCode == 404) {
        return ResponseModel(false, model.message!.tr, response.body);
      } else if (response.statusCode == 500) {
        return ResponseModel(
            false, model.message?.tr ?? LocalString.serverError.tr, '');
      } else {
        return ResponseModel(
            false, model.message?.tr ?? LocalString.somethingWentWrong.tr, '');
      }
    } on SocketException {
      return ResponseModel(false, LocalString.somethingWentWrong, '');
    } on FormatException {
      sharedPreferences.setBool(SharedPreferenceHelper.rememberMeKey, false);
      Get.offAllNamed(RouteHelper.loginScreen);
      return ResponseModel(false, LocalString.badResponseMsg.tr, '');
    } catch (e) {
      return ResponseModel(false, e.toString(), '');
    }
  }

  String token = '';
  initToken() {
    if (sharedPreferences.containsKey(SharedPreferenceHelper.accessTokenKey)) {
      String? t =
          sharedPreferences.getString(SharedPreferenceHelper.accessTokenKey);
      token = t ?? '';
    } else {
      token = '';
    }
  }
}
class ResponseModel {
  final bool _status;
  final String _message;
  final String _responseJson;
  ResponseModel(this._status, this._message, this._responseJson);

  bool get status => _status;
  String get message => _message;
  String get responseJson => _responseJson;
}

class StatusModel {
  StatusModel({
    bool? status,
    String? message,
  }) {
    _status = status;
    _message = message;
  }

  StatusModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'].toString();
  }
  bool? _status;
  String? _message;

  bool? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }
}
class Method {
  static const getMethod = "get";
  static const postMethod = "post";
  static const putMethod = "put";
  static const updateMethod = "update";
  static const deleteMethod = "delete";
}
