import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OrientationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Lock screen to portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  void onClose() {
    // Reset to allow all orientations
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    super.onClose();
  }
}
