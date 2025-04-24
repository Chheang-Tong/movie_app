import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:movie_app/core/core.dart';
import 'package:movie_app/feature/video/controller/video_controller.dart';

import '../../../common/common.dart';

class Comment extends StatefulWidget {
  const Comment({super.key});

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  final VideoController controller = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoController>(builder: (controller) {
      return Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: controller.scrollController,
              child: Column(
                children: [
                  ...List.generate(
                    controller.list,
                    (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                margin: const EdgeInsets.all(8),
                                child: const CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/spider_man.png'),
                                ),
                              ),
                              const Text('Kristin Waston'),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "Here's a basic structure for using GridView.builder in Flutter. You need to provide a gridDelegate to define the layout of the grid, and an itemBuilder to build each item.",
                            ),
                          ),
                          Row(
                            children: [
                              Rating(
                                rating: 3.5,
                                onChanged: (double rate) {
                                  print(rate);
                                },
                              ),
                              const SizedBox(width: 15),
                              const Text('6 hours ago')
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                  if (controller.isHide)
                    TextButton(
                      onPressed: () {
                        controller.moreCmt();
                      },
                      child: Text('Show More Comment'),
                    ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: controller.isFabVisible.value
            ? SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    side: BorderSide(
                      color: ColorResources.blueColor,
                      width: 2,
                    ),
                    backgroundColor: ColorResources.cardColorDark,
                  ),
                  onPressed: () {
                    controller.showKeyboard(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.pen,
                        color: ColorResources.colorLightGrey,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'New Comment',
                        style: TextStyle(
                          color: ColorResources.colorLightGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      );
    });
  }
}
