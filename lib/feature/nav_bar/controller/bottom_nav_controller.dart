import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../feature.dart';

class BottomNavController extends GetxController {
  int selectedIndex = 0;
  List<Widget> screen = [
    DashboardScreen(),
    Center(
      child: Text('1'),
    ),
    Center(
      child: Text('1'),
    ),
    Center(
      child: Text('1'),
    ),
    Center(
      child: Text('1'),
    ),
  ];
  changeScreen(int index) {
    selectedIndex = index;
    update();
  }
}
