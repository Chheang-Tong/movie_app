import 'package:get/get.dart';
import '../../feature/feature.dart';

class RouteHelper {
  static const String splashScreen = "/splash_screen";
  static const String onboardScreen = '/onboard_screen';
  static const String loginScreen = "/login_screen";
  static const String bottomNavBar = '/bottom_nav_bar';
  static const String dashboardScreen = "/dashboard_screen";
  static const String video = "/video";
  List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: onboardScreen, page: () => OnboardScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: bottomNavBar, page: () => BottomNavBar()),
    GetPage(name: dashboardScreen, page: () => DashboardScreen()),
    GetPage(name: video, page: () => Video()),
  ];
}
