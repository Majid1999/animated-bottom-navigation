import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:navigation/core/utils/bottom_navigation/animated_bottom_bar.dart';
import 'package:navigation/features/home/presentation/controller/home_controller.dart';

import '../../../../core/utils/bottom_navigation/models/bottom_bar_item_model.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  final pageColors = [
    Colors.purple,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('4WG'),
        centerTitle: true,
        actions: [
          appLightDarkSwitch(),
        ],
      ),
      body: PageView(
        controller: controller.pageController,
        children: List.generate(
          pageColors.length,
          (index) => Container(
            color: pageColors[index].withAlpha(80),
            child: Center(child: Text('Page ${index + 1}')),
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: Obx(
        () => AnimatedBottomBar(
          notchBottomBarController: controller.notchBottomBarController,
          showLabel: true,
          showShadow: false,
          showBlurBottomBar: false,
          itemLabelStyle: context.theme.textTheme.bodySmall,
          color: controller.isLight.value ? Colors.white : Colors.black,
          notchColor: controller.isLight.value ? Colors.white : Colors.black,
          removeMargins: true,
          bottomBarWidth: 500,
          durationInMilliSeconds: 500,
          bottomBarItems: [
            uiBottomItem(0,Icons.home,'home'),
            uiBottomItem(0,Icons.search,'search'),
            uiBottomItem(0,Icons.add,'add'),
            uiBottomItem(0,Icons.history,'history'),
            uiBottomItem(0,Icons.person,'profile'),
          ],
          onTap: (index) {
            controller.pageController.jumpToPage(index);
          },
        ),
      ),
    );
  }

  uiBottomItem(int index, IconData icon, String text) => BottomBarItem(
        inActiveItem: Icon(
          icon,
          color: controller.isLight.value ? Colors.black : Colors.white,
        ),
        activeItem: Icon(
          icon,
          color: controller.isLight.value ? Colors.black : Colors.white,
        ),
        itemLabel: text,
      );

  appLightDarkSwitch() => Obx(
        () => Switch(
          value: controller.isLight.value,
          onChanged: (value) {
            if (value) {
              Get.changeThemeMode(ThemeMode.light);
            } else {
              Get.changeThemeMode(ThemeMode.dark);
            }
            controller.changeTheme(value);
          },
        ),
      );
}
