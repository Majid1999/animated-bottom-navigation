import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigation/core/controller/base_controller.dart';

class HomeController extends BaseController {
  final pageIndex = 0.obs;

  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void changePageIndex(int value) => pageIndex.value = value;
}
