import 'package:get/get.dart';
import '/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;
  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;
  static const _themeKey = 'theme_key';
  ThemeController({required this.sharedPreferences}) {
    _loadCurrentTheme();
  }

  void _loadCurrentTheme() {
    _darkTheme = sharedPreferences.getBool(_themeKey) ?? false;
    update();
  }

  void changeTheme() {
    _darkTheme = !_darkTheme;
    sharedPreferences.setBool(_themeKey, _darkTheme);
    if (_darkTheme) {
      Get.changeTheme(dark);
    } else {
      Get.changeTheme(light);
    }
    update();
  }
}