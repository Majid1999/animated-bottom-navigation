import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigation/config/route/routes.dart';
import 'package:navigation/core/theme/app_themes.dart';

import 'config/route/navigation.dart';

void main() async {
  var initialRoute = await Routes.initialRoute;
  runApp(MyApp(initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: Navigation.routes,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
