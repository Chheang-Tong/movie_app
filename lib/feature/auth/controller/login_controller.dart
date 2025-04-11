import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/core/core.dart';
import 'package:movie_app/feature/auth/repo/login_repo.dart';

class LoginController extends GetxController {
  LoginRepo loginRepo;
  final FocusNode emailFocusNode = FocusNode(), passwordFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();

  String? email;
  String? password;

  bool remember = false, isSubmitLoading = false, isHide = true;
  LoginController({required this.loginRepo});

  Future<void> checkAndGotoNextStep() async {
    if (remember) {
      await loginRepo.apiService.sharedPreferences.setBool(SharedPreferenceHelper.rememberMeKey, true);
    } else {
      await loginRepo.apiService.sharedPreferences.setBool(SharedPreferenceHelper.rememberMeKey, false);
    }

    await loginRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.userIdKey, '1');
    await loginRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.accessTokenKey, ' value');

    Get.offAndToNamed('page');
    if (remember) {
      changeRememberMe();
    }
  }

  void loginUser() {
    isSubmitLoading = true;
    update();

  }

  changeRememberMe() {
    remember = !remember;
    update();
  }

  changeHide() {
    isHide = !isHide;
    update();
  }
}
