import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:navigation/core/theme/app_themes.dart';
import 'package:navigation/core/utils/animated_bottom_navigation/curved_navigation_bar.dart';
import 'package:navigation/features/home/presentation/controller/home_controller.dart';

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
        () => CurvedNavigationBar(
          index: 0,
          height: 60.0,
          items: <Widget>[
            uiBottomItem(0, Icons.home, 'home'),
            uiBottomItem(1, Icons.search, 'search'),
            uiBottomItem(2, Icons.add, 'add'),
            uiBottomItem(3, Icons.history, 'history'),
            uiBottomItem(4, Icons.perm_identity, 'profile'),
          ],
          color: controller.isLight.value ? Colors.white : Colors.black,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 800),
          onTap: (index) {
            controller.pageController.jumpToPage(index);
            controller.changePageIndex(index);
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }

  uiBottomItem(int index, IconData icon, String text) => Column(children: [
        Icon(icon, size: 30),
        if (index != controller.pageIndex.value) Text(text),
      ]);

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
