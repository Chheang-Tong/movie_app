import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/common/common.dart';
import '/core/core.dart';
import '/core/service/di_service.dart' as service;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Map<String, Map<String, String>> languages = await service.init();

  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp(
    languages: languages,
  ));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>> languages;
  const MyApp({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (theme) {
      return GetBuilder<Localizationcontroller>(
          builder: (localizationcontroller) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.noTransition,
          transitionDuration: Duration(milliseconds: 200),
          initialRoute: RouteHelper.splashScreen,
          navigatorKey: Get.key,
          getPages: RouteHelper().routes,
          theme: theme.darkTheme ? light : dark,
          locale: localizationcontroller.locale,
          translations: Messages(languages: languages),
          fallbackLocale: Locale(
            localizationcontroller.locale.languageCode,
            localizationcontroller.locale.countryCode,
          ),
        );
      });
    });
  }
}
