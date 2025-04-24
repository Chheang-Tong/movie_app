import 'package:get/get.dart';
import '../../feature/feature.dart';

class RouteHelper {
  static const String splashScreen = "/splash_screen";
  static const String onboardScreen = '/onboard_screen';
  static const String loginScreen = "/login_screen";
  static const String bottomNavBar = '/bottom_nav_bar';
  static const String dashboardScreen = "/dashboard_screen";
  static const String video = "/video";
  static const String myList = '/mylist_screen';
  static const String download = '/download';
  static const String favoriteMovie = '/favorite_movie';
  static const String liveScreen = '/live_screen';

  List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: onboardScreen, page: () => OnboardScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: bottomNavBar, page: () => BottomNavBar()),
    GetPage(name: dashboardScreen, page: () => DashboardScreen()),
    GetPage(name: video, page: () => Video()),
    GetPage(name: myList, page: () => MylistScreen()),
    GetPage(name: download, page: () => Download()),
    GetPage(name: favoriteMovie, page: () => FavoriteMovie()),
    GetPage(name: liveScreen, page: () => LiveScreen()),
  ];
}
