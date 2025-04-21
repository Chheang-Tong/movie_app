import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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

  Color? color, colors;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    colors = isDarkMode ? Colors.white : Colors.black;
    color = isDarkMode ? Colors.black : Colors.white;
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
                              color: ColorResources.blueColor.withOpacity(0.15),
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(10, (index) {
                        return Container(
                          height: 60,
                          width: 80,
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: ColorResources.blueGreyColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      }),
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
                      color: color,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                  DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        Container(
                          height: 25,
                          margin: EdgeInsets.only(top: 30),
                          // padding: EdgeInsets.only(left: 0),
                          child: TabBar(
                            labelPadding: EdgeInsets.all(0),
                            indicatorPadding: EdgeInsets.all(0),
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.amber,
                            indicatorWeight: 2,
                            // dividerHeight: 0,
                            labelStyle: semiBoldDefault,
                            unselectedLabelStyle: semiBoldDefault,
                            indicator: RoundedRectangleTabIndicator(
                              color: Colors.red,
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
                          height: size.height /
                              2, // Adjust height based on your layout
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
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
}



