import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'app_theme_mode_selector.dart';
import 'system_theme_type_switcher.dart';

class ThemeSettings extends StatelessWidget {
  const ThemeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.padding_20,
      ),
      child: const Column(
        //TODO Add Theme Parameters title
        children: <Widget>[
          SystemThemeTypeSwitcher(),
          AppThemeModeSelector(),
        ],
      ),
    );
  }
}
