import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movie_app/core/core.dart';

import '../../../common/common.dart';

class SplashController extends GetxController {
  ApiService apiService;
  Localizationcontroller localizationcontroller;
  bool isLoading = true;
  SplashController({
    required this.apiService,
    required this.localizationcontroller,
  });

  gotoNextPage() async {
    await loadLanguage();
    bool isRemember = apiService.sharedPreferences
            .getBool(SharedPreferenceHelper.rememberMeKey) ??
        false;
    bool isOnBoard = apiService.sharedPreferences
            .getBool(SharedPreferenceHelper.onboardKey) ??
        false;
    noInternet = false;
    update();
    getData(isRemember, isOnBoard);
  }

  bool noInternet = false;
  void getData(bool isRemember, bool isOnBoard) async {
    isLoading = false;
    update();

    if (isOnBoard == false) {
      Future.delayed(const Duration(seconds: 1), () {
        Get.offAndToNamed(RouteHelper.onboardScreen);
      });
    } else {
      if (isRemember) {
        Future.delayed(const Duration(seconds: 1), () {
          Get.offAndToNamed(RouteHelper.dashboardScreen);
        });
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          Get.offAndToNamed(RouteHelper.loginScreen);
        });
      }
    }
  }

  Future<bool> initSharedData() {
    if (!apiService.sharedPreferences
        .containsKey(SharedPreferenceHelper.countryCode)) {
      return apiService.sharedPreferences.setString(
        SharedPreferenceHelper.countryCode,
        LocalString.appLanguages[0].countryCode,
      );
    }
    if (!apiService.sharedPreferences
        .containsKey(SharedPreferenceHelper.languageCode)) {
      return apiService.sharedPreferences.setString(
        SharedPreferenceHelper.languageCode,
        LocalString.appLanguages[0].languageCode,
      );
    }
    return Future.value(true);
  }

  Future<void> loadLanguage() async {
    localizationcontroller.loadCurrentLanguage();
    String languageCode = localizationcontroller.locale.languageCode;
    Map<String, Map<String, String>> language = {};
    final String response =
        await rootBundle.loadString('assets/lang/$languageCode.json');
    var resJson = jsonDecode(response);
    saveLanguageList(response);
    var value = resJson as Map<String, dynamic>;
    Map<String, String> json = {};
    value.forEach((key, value) {
      json[key] = value.toString();
    });
    language[
            '${localizationcontroller.locale.languageCode}_${localizationcontroller.locale.countryCode}'] =
        json;
    Get.addTranslations(Messages(languages: language).keys);
  }

  void saveLanguageList(String languageJson) async {
    await apiService.sharedPreferences
        .setString(SharedPreferenceHelper.languageListKey, languageJson);
    return;
  }
}
