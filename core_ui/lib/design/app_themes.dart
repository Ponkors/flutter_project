import 'package:core_ui/design/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.white,
      splashColor: AppColors.grey,
      primaryColor: AppColors.orange,
      iconTheme: const IconThemeData(
        color: AppColors.orange,
      ),
      textTheme: const TextTheme(bodyMedium: TextStyle(color: AppColors.grey)),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.black,
      splashColor: AppColors.grey,
      primaryColor: AppColors.orange,
      iconTheme: const IconThemeData(
        color: AppColors.orange,
      ),
      textTheme: const TextTheme(bodyMedium: TextStyle(color: AppColors.white)),
    );
  }
}
