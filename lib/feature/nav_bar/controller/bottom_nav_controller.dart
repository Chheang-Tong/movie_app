import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../feature.dart';

class BottomNavController extends GetxController {
  int selectedIndex = 0;
  List<Widget> screen = [
    DashboardScreen(),
    ExploreScreen(),
    LiveTvScreen(),
    MylistScreen(),
    ProfileScreen(),
  ];
  changeScreen(int index) {
    selectedIndex = index;
    update();
  }

}
