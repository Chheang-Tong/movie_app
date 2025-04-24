import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  int list = 2;
  bool isHide = true, newcmd = false, season = true;

  RxBool isFabVisible = true.obs;

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
   final List<String> item2 = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
  ];
  var selectedValue = ''.obs;
  var selectedValue2 = ''.obs;


  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isFabVisible.value) {
          isFabVisible.value = false;
          update();
        }
      } else if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!isFabVisible.value) {
          isFabVisible.value = true;
          update();
        }
      }
    });
  }

  void showKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(focusNode);
    newcmd = true;
    update();
  }

  void setSelected(String? value) {
    selectedValue.value = value ?? '';
    update();
  }
  void setSelected2(String? value) {
    selectedValue2.value = value ?? '';
    update();
  }

  void clears() {
    textController.clear();
    FocusScope.of(Get.context!).unfocus();
    // update();
  }

  void moreCmt() {
    list = 10;
    isHide = false;
    update();
  }

  @override
  void onClose() {
    textController.dispose();
    scrollController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
