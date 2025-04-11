import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:movie_app/feature/feature.dart';

import '../../../core/core.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    Get.put(BottomNavController());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(builder: (controller) {
      return Scaffold(
        extendBody: true,
        body: controller.screen[controller.selectedIndex],
        bottomNavigationBar: Container(
          height: 60,
          padding: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: ColorResources.bottomSheetCloseIconColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(FontAwesomeIcons.home, 'Home', 0),
              _buildNavItem(FontAwesomeIcons.compass, 'Explore', 1),
              _buildNavItem(FontAwesomeIcons.towerBroadcast, 'Live TV', 2),
              _buildNavItem(FontAwesomeIcons.list, 'My List', 3),
              _buildNavItem(FontAwesomeIcons.user, 'Profile', 4),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GetBuilder<BottomNavController>(builder: (controller) {
      return GestureDetector(
        onTap: () {
          controller.changeScreen(index);
        },
        child: Container(
          height: 55,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: controller.selectedIndex == index ? 22 : 20,
                color: controller.selectedIndex == index
                    ? ColorResources.blueColor
                    : ColorResources.blueGreyColor,
              ),
              Text(
                label,
                style: TextStyle(
                  fontWeight: controller.selectedIndex == index
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: controller.selectedIndex == index
                      ? ColorResources.blueColor
                      : ColorResources.blueGreyColor,
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
