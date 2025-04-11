import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/core/core.dart';

import '../../../common/common.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});
  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  var currentPageID = 0;

  @override
  void initState() {
    super.initState();
    Get.put(
      ApiService(
        sharedPreferences: Get.find(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IntroductionScreen(
          bodyPadding: const EdgeInsets.only(top: Dimensions.space200),
          key: introKey,
          globalBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          allowImplicitScrolling: true,
          infiniteAutoScroll: false,
          skip: const Icon(Icons.skip_next),
          globalHeader: Align(
            alignment: Alignment.topCenter,
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.only(top: Dimensions.space50),
                child: Image.asset(
                  MyImages.appLogo,
                  height: Dimensions.space90,
                ),
              ),
            ),
          ),
          showSkipButton: false,
          dotsFlex: 2,
          showDoneButton: false,
          showBackButton: false,
          back: const Icon(Icons.arrow_back),
          next: const Icon(Icons.arrow_forward),
          showNextButton: false,
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(Dimensions.space15),
          controlsPadding: kIsWeb
              ? const EdgeInsets.all(Dimensions.space12)
              : const EdgeInsets.fromLTRB(Dimensions.space8, Dimensions.space3,
                  Dimensions.space8, Dimensions.space10),
          dotsDecorator: const DotsDecorator(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimensions.space3))),
            activeColor: ColorResources.primaryColor,
            size: Size(10.0, 5.0),
            color: ColorResources.hintColor,
            activeSize: Size(Dimensions.space20, Dimensions.space5),
            activeShape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(Dimensions.space3)),
            ),
          ),
          onChange: (v) {
            debugPrint("Page Key $v");
            setState(() {
              currentPageID = v;
            });
          },
          pages: [
            PageViewModel(
              // title: LocalString.onboardTitle1.tr,
              body: LocalString.onboardSubTitle1.tr,
              titleWidget: Text(
                LocalString.onboardTitle1.tr,
                style: boldOverLarge,
              ),
              image: Lottie.asset(
                MyImages.onboardingOne,
              ),
              decoration: PageDecoration(
                titleTextStyle: semiBoldExtraLarge.copyWith(
                  color: ColorResources.cardColor,
                ),
                titlePadding: const EdgeInsets.symmetric(
                  vertical: Dimensions.space5,
                  horizontal: Dimensions.space15,
                ),
                bodyPadding: const EdgeInsets.symmetric(
                  vertical: Dimensions.space5,
                  horizontal: Dimensions.space15,
                ),
                bodyTextStyle: regularDefault.copyWith(
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                ),
              ),
            ),
            PageViewModel(
              titleWidget: Text(
                LocalString.onboardTitle2.tr,
                style: boldOverLarge,
              ),
              body: LocalString.onboardSubTitle2.tr,
              image: Lottie.asset(
                MyImages.onboardingTwo,
              ),
              decoration: PageDecoration(
                titleTextStyle: semiBoldExtraLarge.copyWith(
                  color: ColorResources.cardColor,
                ),
                titlePadding: const EdgeInsets.symmetric(
                  vertical: Dimensions.space5,
                  horizontal: Dimensions.space15,
                ),
                bodyPadding: const EdgeInsets.symmetric(
                  vertical: Dimensions.space5,
                  horizontal: Dimensions.space15,
                ),
                bodyTextStyle: regularDefault,
              ),
            ),
            PageViewModel(
              titleWidget: Text(
                LocalString.onboardTitle3.tr,
                style: boldOverLarge,
              ),
              body: LocalString.onboardSubTitle3.tr,
              image: Lottie.asset(
                MyImages.onboardingThree,
              ),
              decoration: PageDecoration(
                titleTextStyle: semiBoldExtraLarge.copyWith(
                  color: ColorResources.cardColor,
                ),
                titlePadding: const EdgeInsets.symmetric(
                  vertical: Dimensions.space5,
                  horizontal: Dimensions.space15,
                ),
                bodyPadding: const EdgeInsets.symmetric(
                  vertical: Dimensions.space5,
                  horizontal: Dimensions.space15,
                ),
                bodyTextStyle: regularDefault,
              ),
            ),
          ],
          globalFooter: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.space25,
                ),
                child: RoundedButton(
                    text: (currentPageID + 1) ==
                            introKey.currentState?.getPagesLength()
                        ? LocalString.getStarted.tr
                        : LocalString.next.tr,
                    cornerRadius: Dimensions.space10,
                    press: () async {
                      if (introKey.currentState!.getCurrentPage() + 1 ==
                          introKey.currentState!.getPagesLength()) {
                        await Get.find<ApiService>()
                            .sharedPreferences
                            .setBool(SharedPreferenceHelper.onboardKey, true)
                            .whenComplete(() {
                          Get.offAllNamed(RouteHelper.loginScreen);
                        });
                      } else {
                        introKey.currentState!.next();
                      }
                    }),
              ),
              const SizedBox(height: Dimensions.space5),
              const CustomDivider()
            ],
          ),
        ),
      ],
    );
  }
}
