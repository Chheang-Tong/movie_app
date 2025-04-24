import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// import '../../feature.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({super.key});
  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  bool isHide = false, isMiniPlayVisible = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          isHide = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final arguments = Get.arguments;
    final String live = arguments['live'];
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isHide = !isHide;
                });
                Future.delayed(Duration(seconds: 5), () {
                  setState(() {
                    isHide = false;
                  });
                });
              },
              child: Scaffold(
                body: Hero(
                  tag: live,
                  child: Container(
                      height: size.height / 3,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        image: DecorationImage(
                          image: AssetImage('assets/images/spider_man.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: AnimatedOpacity(
                        opacity: isHide ? 1 : 0,
                        duration: Duration(milliseconds: 300),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.play_arrow,
                                    size: 50,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.play_arrow,
                                    size: 50,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.play_arrow,
                                    size: 50,
                                  ))
                            ],
                          ),
                        ),
                      )),
                ),
              ),
            ),
            Positioned(
              top: 5,
              left: 5,
              child: AnimatedOpacity(
                opacity: isHide ? 1 : 0,
                duration: Duration(milliseconds: 300),
                child: IconButton(
                  onPressed: () {
                    Get.back(closeOverlays: true);
                  },
                  icon: Icon(Icons.keyboard_arrow_down),
                ),
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: AnimatedOpacity(
                opacity: isHide ? 1 : 0,
                duration: Duration(milliseconds: 300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_arrow_down),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.cast),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.closed_caption_outlined),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(FontAwesomeIcons.gear),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
