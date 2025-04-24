import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../feature.dart';

class BottomNavController extends GetxController {
  int selectedIndex = 0;
  bool isShow = true;
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

  void changeShow() {
    isShow = !isShow;
    update();
  }
}
