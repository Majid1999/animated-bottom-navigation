import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  final isLight = true.obs;


  @override
  void onInit() {
    super.onInit();
    isLight.value = !Get.isDarkMode;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void changeTheme(bool value) => isLight.value = value;
}
