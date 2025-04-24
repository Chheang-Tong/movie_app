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
  final BottomNavController controller = Get.put(BottomNavController());

  late Offset position;
  List<Offset> corners = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Size size = MediaQuery.of(context).size;
    position = Offset(
        size.width - size.width / 2 - 10, size.height - size.height / 3 + 30);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    corners = [
      Offset(10, 50), // Top Left
      Offset(size.width - size.width / 2, 50), // Top Right
      Offset(size.width - size.width / 2 - 10,
          size.height - size.height / 3 + 30), // Bottom Right
      Offset(10, size.height - size.height / 3 + 30), // Bottom Left
    ];
    return GetBuilder<BottomNavController>(builder: (controller) {
      return Scaffold(
        extendBody: true,
        body: Stack(children: [
          controller.screen[controller.selectedIndex],
          if (controller.isShow)
            Positioned(
              left: position.dx,
              top: position.dy,
              child: Draggable(
                feedback: miniPlay(),
                childWhenDragging: Container(),
                onDragEnd: (details) {
                  setState(() {
                    position = _getNearestCorner(details.offset);
                  });
                },
                child: miniPlay(),
              ),
            ),
        ]),
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

  Offset _getNearestCorner(Offset dragOffset) {
    return corners.reduce(
      (closest, current) =>
          (dragOffset - current).distance < (dragOffset - closest).distance
              ? current
              : closest,
    );
  }

  Widget miniPlay() {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 2,
      height: size.height / 5,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          IconButton(
              onPressed: () {
                controller.changeShow();
              },
              icon: Icon(Icons.close)),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              height: 45,
              decoration: BoxDecoration(
                color: ColorResources.colorGrey,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.replay_10,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_arrow,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.forward_10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
