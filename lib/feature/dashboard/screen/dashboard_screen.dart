import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:movie_app/common/common.dart';
import 'package:movie_app/core/core.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final orientationController = Get.put(OrientationController());
  List<String> text = [
    'Action',
    '2022',
    'United Stored',
  ];
  final String tag = 'live';

  @override
  void initState() {
    Get.put(ThemeController(sharedPreferences: Get.find()));
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<OrientationController>(); // This triggers onClose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
              leading: Container(
                margin: EdgeInsets.only(
                  left: 24,
                  bottom: 5,
                  top: 5,
                ),
                height: 56,
                width: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      MyImages.appLogo,
                    ),
                  ),
                ),
              ),
              actions: [
                GetBuilder<ThemeController>(builder: (controller) {
                  return IconButton(
                    onPressed: () {
                      controller.changeTheme();
                    },
                    icon: Icon(
                      FontAwesomeIcons.bell,
                    ),
                  );
                }),
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
                    textXbtn(
                      text: "Top 10 Movies This Week",
                      tap: () {},
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(10, (index) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(RouteHelper.video);
                            },
                            child: Container(
                              height: size.height * 0.2,
                              width: size.width * 0.3,
                              margin: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: ColorResources.blueGreyColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 8),
                    textXbtn(
                      text: "Categories",
                      tap: () {},
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.only(right: 4),
                            height: size.height * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorResources.borderColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'TV Channels',
                                style: TextStyle(
                                  fontFamily: 'Urbanist',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: size.height * 0.2,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: 4,
                                      bottom: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorResources.blueColor,
                                    ),
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Movies',
                                        style: TextStyle(
                                          fontFamily: 'Urbanist',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: 4,
                                      top: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorResources.blueColor,
                                    ),
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Cartoon',
                                        style: TextStyle(
                                          fontFamily: 'Urbanist',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    textXbtn(
                      text: "On TV",
                      tap: () {},
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          10,
                          (index) {
                            return SizedBox(
                              width: size.width * 0.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Hero(
                                    tag: 'live_$index',
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Container(
                                        height: size.height * 0.15,
                                        width: size.width * 0.5,
                                        margin: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: ColorResources.blueGreyColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Stack(
                                          children: [
                                            Center(
                                              child: IconButton(
                                                onPressed: () {
                                                  Get.toNamed(
                                                      RouteHelper.liveScreen,
                                                      arguments: {
                                                        'live': 'live_$index'
                                                      });
                                                },
                                                icon: Icon(
                                                  Icons.play_circle,
                                                  size: 35,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 10,
                                              left: 10,
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 4,
                                                  vertical: 2,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: ColorResources
                                                      .cardColorDark,
                                                ),
                                                alignment: Alignment.center,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      margin:
                                                          EdgeInsets.all(2.0),
                                                      height: 8,
                                                      width: 8,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: ColorResources
                                                            .redColor,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Live',
                                                      style: TextStyle(
                                                        fontFamily: 'Urbanist',
                                                        color: ColorResources
                                                            .colorWhite,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ),
                                    child: Text(
                                      'RenderFlex children have non-zero flex',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: 'Urbanist',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.all(4),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                              color: ColorResources.blueColor,
                                              width: 1,
                                            ),
                                          ),
                                          child: Text(
                                            'Fox',
                                            style: TextStyle(
                                              color: ColorResources.redColor,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '12:50 - 13:55',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontFamily: 'Urbanist',
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textXbtn({
    required String text,
    required Function tap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () => tap(),
          child: Text('See All'),
        ),
      ],
    );
  }
}
