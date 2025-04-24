import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:get/get.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common/common.dart';
import '../../../core/core.dart';
import '../../feature.dart';

class Video extends StatefulWidget {
  const Video({super.key});
  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  List<IconData> icon = [
    IcoFontIcons.download,
    MdiIcons.bookmarkMinusOutline,
    FeatherIcons.send,
    MdiIcons.dotsHorizontalCircleOutline,
  ];
  List<String> text = [
    'Action',
    '2022',
    'United Stored',
  ];

  final VideoController controller = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GetBuilder<VideoController>(builder: (controller) {
      return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark,
              ),
              expandedHeight: 275.0,
              backgroundColor: Colors.transparent,
              elevation: 50.0,
              stretch: true,
              // pinned: true,
              // floating: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Star Wars: The Last Jedi',
                  style: TextStyle(
                    color: ColorResources.appBarContentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                centerTitle: true,
                titlePadding: EdgeInsets.only(bottom: 25),
                background: Image.network(
                  'https://i.pinimg.com/736x/37/1d/97/371d97f08f75a472b5ae37c217913816.jpg',
                  fit: BoxFit.cover,
                ),
                stretchModes: [
                  StretchMode.blurBackground,
                  StretchMode.zoomBackground,
                ],
                collapseMode: CollapseMode.parallax,
              ),
              leadingWidth: 80,
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.cast,
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        icon.length,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              print(index);
                              Get.bottomSheet(
                                bottomsSheet(controller),
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 4,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color:
                                    ColorResources.blueColor.withOpacity(0.15),
                              ),
                              child: Icon(
                                icon[index],
                                color: ColorResources.blueColor,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Star(
                            icon: Icons.star,
                            size: 18,
                            color1: ColorResources.blueColor.withOpacity(0.3),
                            color2: ColorResources.blueColor,
                          ),
                        ),
                        Text(
                          '9.8',
                          style: boldDefault.copyWith(
                            color: ColorResources.blueColor,
                          ),
                        ),
                        dotPoint(
                          color: ColorResources.colorWhite,
                          size: 5,
                        ),
                        Text(
                          '2h 15mn',
                          style: semiBoldDefault,
                        ),
                        dotPoint(
                          color: ColorResources.colorWhite,
                          size: 5,
                        ),
                        Text(
                          'Action. Science Fiction',
                          style: semiBoldDefault,
                        ),
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        text.length,
                        (index) {
                          return Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(4),
                            padding: EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: ColorResources.blueColor,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              text[index],
                              style: TextStyle(
                                color: ColorResources.blueColor,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    ReadMoreText(
                      text: """
Jake Sully lives with his newfound family formed on the extrasolar moon Pandora. 
Once a familiar threat return to finish what was previously started. 
Jake must work with Neytiri and the army of the Naytiri are  slnflslfm ldnfla; previously started.""",
                      textStyle: mediumDefault.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Column(
                      children: List.generate(
                        2,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 8),
                                  width: size.width * 0.45,
                                  height: size.height * 0.15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.amber,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Avatar: The War of Water',
                                        style: semiBoldDefault,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        'Avatar: The War of Water',
                                        style: semiBoldDefault,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 15),
                                      Text(
                                        '1 mn  15 sec',
                                        style: semiBoldSmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    if (controller.season)
                      DefaultTabController(
                        length: 5,
                        child: Column(
                          children: [
                            Container(
                              height: 25,
                              margin: EdgeInsets.only(top: 20),
                              padding: EdgeInsets.only(left: 0),
                              child: TabBar(
                                isScrollable: true,
                                labelPadding: EdgeInsets.all(0),
                                indicatorPadding: EdgeInsets.all(0),
                                labelColor: ColorResources.blueColor,
                                unselectedLabelColor:
                                    ColorResources.blueGreyColor,
                                indicatorWeight: 2,
                                // dividerHeight: 0,
                                labelStyle: semiBoldDefault,
                                unselectedLabelStyle: semiBoldDefault,
                                indicator: RoundedRectangleTabIndicator(
                                  color: ColorResources.blueColor,
                                  weight: 3,
                                  width: size.width / 3,
                                ),
                                tabs: [
                                  ...List.generate(5, (index) {
                                    return Tab(
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: size.width / 3,
                                        child: Text(
                                          'Season ${index + 1}',
                                          style: TextStyle(
                                            fontSize: 15,
                                            // color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.4,
                              child: TabBarView(
                                children: [
                                  ...List.generate(
                                    5,
                                    (index) => Season(),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    DefaultTabController(
                      length: 3,
                      child: Column(
                        children: [
                          Container(
                            height: 25,
                            margin: EdgeInsets.only(top: 4),
                            // padding: EdgeInsets.only(left: 0),
                            child: TabBar(
                              labelPadding: EdgeInsets.all(0),
                              indicatorPadding: EdgeInsets.all(0),
                              labelColor: ColorResources.blueColor,
                              unselectedLabelColor:
                                  ColorResources.blueGreyColor,
                              indicatorWeight: 2,
                              // dividerHeight: 0,
                              labelStyle: semiBoldDefault,
                              unselectedLabelStyle: semiBoldDefault,
                              indicator: RoundedRectangleTabIndicator(
                                color: ColorResources.blueColor,
                                weight: 3,
                                width: size.width / 3,
                              ),
                              tabs: [
                                Tab(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: size.width / 3,
                                    child: Text(
                                      'More Like This',
                                      style: TextStyle(
                                        fontSize: 15,
                                        // color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: size.width / 3,
                                    child: Text(
                                      'About',
                                      style: TextStyle(
                                        fontSize: 15,
                                        // color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: size.width / 3,
                                    child: Text(
                                      'Comment',
                                      style: TextStyle(
                                        fontSize: 15,
                                        // color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.55,
                            child: TabBarView(
                              children: [
                                More(),
                                About(),
                                Comment(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomSheet: controller.newcmd
            ? Container(
                color: ColorResources.appBarColor,
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.textController,
                        focusNode: controller.focusNode,
                        onFieldSubmitted: (value) {},
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          fillColor: ColorResources.blueGreyColor,
                          filled: true,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.clears();
                        controller.newcmd = false;
                      },
                      icon: Icon(
                        Icons.send,
                      ),
                    ),
                  ],
                ),
              )
            : null,
      );
    });
  }

  Widget bottomsSheet(VideoController controller) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        color: ColorResources.colorGrey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 3,
            width: 50,
            // padding: EdgeInsets.symmetric(horizontal: 4),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorResources.cardColor,
            ),
          ),
          Center(
            child: Text(
              "Download",
              style: semiBoldOverLarge,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    height: 150,
                    width: 80,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Rating(
                    rating: 3.5,
                    onChanged: (double rating) {},
                    starSize: 10,
                  ),
                  Text("(24.679 users)"),
                ],
              ),
              Container(
                margin: EdgeInsets.all(4),
                height: 200,
                child: VerticalDivider(
                  thickness: 1.5,
                  color: ColorResources.blueColor,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "The Last Jedi",
                      style: semiBoldOverLarge,
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() {
                          return DropdownBtn(
                            item: controller.items,
                            onChanged: (String? value) {
                              controller.setSelected(value);
                            },
                            value: controller.selectedValue.value.isEmpty
                                ? null
                                : controller.selectedValue.value,
                            text: 'Select Item',
                          );
                        }),
                        Obx(() {
                          return DropdownBtn(
                            item: controller.item2,
                            onChanged: (String? value) {
                              controller.setSelected2(value);
                            },
                            value: controller.selectedValue2.value.isEmpty
                                ? null
                                : controller.selectedValue2.value,
                            text: 'Select Item',
                          );
                        }),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Divider(height: 3),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Medium(480p)'), Text('7.2 gb')],
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: FlutterSlider(
                        values: [3],
                        jump: true,
                        max: 4,
                        min: 0,
                        handlerWidth: 15,
                        hatchMark: FlutterSliderHatchMark(
                          linesDistanceFromTrackBar: 5,
                          density: 0.5,
                          labels: [
                            FlutterSliderHatchMarkLabel(
                                percent: 0, label: Text('0')),
                            FlutterSliderHatchMarkLabel(
                                percent: 25, label: Text('1')),
                            FlutterSliderHatchMarkLabel(
                                percent: 50, label: Text('2')),
                            FlutterSliderHatchMarkLabel(
                                percent: 75, label: Text('3')),
                            FlutterSliderHatchMarkLabel(
                                percent: 100, label: Text('4')),
                          ],
                        ),
                        trackBar: FlutterSliderTrackBar(),
                        handler: customHandler(Icons.add),
                        onDragging: (handlerIndex, lowerValue, upperValue) {
                          setState(() {});
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Low'), Text('Excellent(1080p)')],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                margin: EdgeInsets.all(4),
                width: MediaQuery.of(context).size.width * 0.45,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: ColorResources.blueGreyColor,
                  ),
                  child: Text(
                    'Cancel',
                    style: semiBoldDefault.copyWith(
                      color: ColorResources.cardColor,
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                margin: EdgeInsets.all(4),
                width: MediaQuery.of(context).size.width * 0.45,
                child: ElevatedButton(
                  onPressed: () {
                    downloadToDownloadsFolder(
                        '1otOEfClkvcvxOPQoRqpZeBmBklhTF1kK', 'example.pdf');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: ColorResources.blueColor,
                  ),
                  child: Text(
                    'Download',
                    style: semiBoldDefault.copyWith(
                      color: ColorResources.cardColor,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<bool> requestStoragePermission() async {
    var status = await Permission.storage.status;

    if (!status.isGranted) {
      status = await Permission.storage.request();
    }

    return status.isGranted;
  }

  Future<void> downloadToDownloadsFolder(String fileId, String fileName) async {
    final hasPermission = await requestStoragePermission();

    if (!hasPermission) {
      print('❌ Storage permission not granted');
      return;
    }

    final dir = Directory('/storage/emulated/0/Download');
    final savePath = '${dir.path}/$fileName';

    try {
      await Dio().download(
        'https://drive.google.com/uc?export=download&id=$fileId',
        savePath,
      );
      print('✅ File saved to Downloads: $savePath');
    } catch (e) {
      print('❌ Download error: $e');
    }
  }

  Widget dotPoint({
    required Color color,
    required double size,
  }) {
    return Container(
      margin: EdgeInsets.all(8),
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  customHandler(IconData icon) {
    return FlutterSliderHandler(
      decoration: BoxDecoration(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.blue.withOpacity(0.3),
                spreadRadius: 0.05,
                blurRadius: 5,
                offset: Offset(0, 1))
          ],
        ),
        child: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.3), shape: BoxShape.circle),
        ),
      ),
    );
  }
}
