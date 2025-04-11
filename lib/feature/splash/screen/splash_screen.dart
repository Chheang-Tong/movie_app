import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/common/common.dart';
import 'package:movie_app/core/core.dart';
import 'package:movie_app/feature/feature.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    ThemeController themeController =
        ThemeController(sharedPreferences: Get.find());
    MyUtils.splashScreenUtils(themeController.darkTheme);
    Get.put(
      Localizationcontroller(
        sharedPreferences: Get.find(),
      ),
    );
    final controller = Get.put(
      SplashController(
        apiService: Get.find(),
        localizationcontroller: Get.find(),
      ),
    );
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(//wrong
      (timeStamp) {
        controller.gotoNextPage();
      },
    );
  }

  @override
  void dispose() {
    ThemeController themeController = ThemeController(
      sharedPreferences: Get.find(),
    );
    MyUtils.allScreensUtils(themeController.darkTheme);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<SplashController>(
        builder: (controller) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Center(
              child: Image.asset('assets/icon/icons.png', height: 100),
            ),
          );
        }
      ),
    );
  }
}
