import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigation/core/controller/base_controller.dart';
import 'package:navigation/core/utils/bottom_navigation/animation_bottom_bar_controller.dart';

class HomeController extends BaseController {
  late PageController pageController;
  late AnimationBottomBarController notchBottomBarController;

  @override
  void onInit() {
    super.onInit();
    notchBottomBarController = AnimationBottomBarController(index: 0);
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

}
