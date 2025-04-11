import 'package:get/get.dart';
import 'package:movie_app/common/common.dart';
import 'package:movie_app/core/core.dart';
import 'package:movie_app/feature/feature.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, Map<String, String>>> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(
    () => sharedPreferences,
    fenix: true,
  );
  Get.lazyPut(
    () => ApiService(
      sharedPreferences: Get.find(),
    ),
  );
  Get.lazyPut(
    () => SplashRepo(
      apiService: Get.find(),
    ),
  );
  Get.lazyPut(
    () => Localizationcontroller(
      sharedPreferences: Get.find(),
    ),
  );
  Get.lazyPut(
    () => ThemeController(
      sharedPreferences: Get.find(),
    ),
  );
  Get.lazyPut(
    () => SplashController(
      apiService: Get.find(),
      localizationcontroller: Get.find(),
    ),
  );
  Map<String, Map<String, String>> language = {};
  language['en_US'] = {"": ""};
  return language;
}
