import 'package:get/get.dart';

class ListController extends GetxController {
  bool isDownload = false;
  void download() {
    isDownload = !isDownload;
    update();
  }
}
