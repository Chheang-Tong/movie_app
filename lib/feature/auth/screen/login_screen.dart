import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../core/core.dart';
import '../../feature.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(LoginRepo(apiService: Get.find()));
    Get.put(LoginController(loginRepo: Get.find())); //make it has order
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<LoginController>().remember = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopWidget(
      nextRoute: '',
      child: SafeArea(
        child: GetBuilder<LoginController>(
          builder: (controller) {
            return Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: ColorResources.appBarColor,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.amber,
                            Colors.blue,
                          ],
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/cate.jpg',
                          ), //backgrond
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 120.0, bottom: 0.0),
                            child: Center(
                              child: Image.asset(
                                MyImages.appLogo,
                                height: 80,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: Dimensions.space30,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    LocalString.login.tr,
                                    style: boldOverLarge.copyWith(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: ColorResources.colorWhite,
                                    ),
                                  ),
                                  Text(
                                    LocalString.loginDesc.tr,
                                    style: regularDefault.copyWith(
                                        fontSize: Dimensions.fontDefault,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                )),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: Dimensions.space20,
                            ),
                            child: Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    controller: controller.emailController,
                                    focusNode: controller.emailFocusNode,
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (value) {
                                      FocusScope.of(context).requestFocus(
                                          controller.passwordFocusNode);
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: ColorResources.blueColor,
                                          width: 2,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      prefixIcon: Icon(Icons.email_outlined),
                                      // prefixIconColor: ColorResources.blueColor,
                                    ),
                                  ),
                                  const SizedBox(height: Dimensions.space20),
                                  TextFormField(
                                    controller: controller.emailController,
                                    focusNode: controller.passwordFocusNode,
                                    textInputAction: TextInputAction.done,
                                    obscureText: controller.isHide,
                                    obscuringCharacter: '•',
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: ColorResources.blueColor,
                                          width: 2,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      prefixIcon: Icon(Icons.key_outlined),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          controller.changeHide();
                                        },
                                        icon: Icon(
                                          controller.isHide
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: Dimensions.space20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            width: 25,
                                            child: Checkbox(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              side: WidgetStateBorderSide
                                                  .resolveWith(
                                                (state) => BorderSide(
                                                  width: 1.0,
                                                  color: controller.remember
                                                      ? ColorResources
                                                          .bottomSheetCloseIconColor
                                                      : Colors.white,
                                                ),
                                              ),
                                              checkColor:
                                                  ColorResources.colorWhite,
                                              activeColor: Colors.green,
                                              value: controller.remember,
                                              onChanged: (value) {
                                                controller.changeRememberMe();
                                              },
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(LocalString.rememberMe.tr),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: Dimensions.space20),
                                  controller.isSubmitLoading
                                      ? const RoundedLoadingBtn()
                                      : RoundedButton(
                                          text: LocalString.signIn.tr,
                                          press: () {
                                            Get.offAndToNamed(
                                              RouteHelper.bottomNavBar,
                                            );
                                          },
                                        ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
