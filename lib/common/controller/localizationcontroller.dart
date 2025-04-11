import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/common/common.dart';
import 'package:movie_app/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Localizationcontroller extends GetxController {
  final SharedPreferences sharedPreferences;
  Localizationcontroller({required this.sharedPreferences});
 
  Locale _locale = Locale(
    LocalString.appLanguages[0].languageCode,
    LocalString.appLanguages[0].countryCode,
  );

  bool _isLtr = true;

  final List<LanguageModel> _languages = [];

  Locale get locale => _locale;
  bool get isLtr => _isLtr;
  List<LanguageModel> get languages => _languages;

  void setLanguage(Locale locale) {
    Get.updateLocale(locale);
    _locale = locale;
    if (_locale.languageCode == 'ar') {
      _isLtr = false;
    } else {
      _isLtr = true;
    }

    update();
  }

  void loadCurrentLanguage() async {
    _locale = Locale(
      sharedPreferences.getString(SharedPreferenceHelper.languageCode) ??
          LocalString.appLanguages[0].languageCode,
      sharedPreferences.getString(SharedPreferenceHelper.countryCode) ??
          LocalString.appLanguages[0].countryCode,
    );
    _isLtr = _locale.languageCode != 'ar';
    update();
  }

  void saveLanguage(Locale locale) async {
    sharedPreferences.setString(SharedPreferenceHelper.languageCode, locale.languageCode);
    sharedPreferences.setString(SharedPreferenceHelper.countryCode, locale.countryCode ?? '');
  }

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void setSelectIndex(int index) {
    _selectedIndex = index;
    update();
  }
}
