import 'package:flutter/material.dart';
import 'package:navigation/core/theme/app_switch_themes.dart';
import 'package:navigation/core/theme/app_text_theme.dart';

import 'app_bar_theme.dart';
import 'app_colors.dart';

class AppThemes {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    cardColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: AppColors.sea),
    textTheme: AppTextThemes.light,
    appBarTheme: AppBarThemes.light,
    scaffoldBackgroundColor: AppColors.sea.shade50,
    switchTheme: AppSwitchThemes.light,
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    cardColor: Colors.black,
    colorScheme: const ColorScheme.dark(primary: AppColors.sea),
    textTheme: AppTextThemes.dark,
    appBarTheme: AppBarThemes.dark,
    scaffoldBackgroundColor: AppColors.sea.shade900.withAlpha(100),
    switchTheme: AppSwitchThemes.dark,
  );
}
