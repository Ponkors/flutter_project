import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'menuPage.settings'.tr(),
      ),
      body: ListView(
        children: const <Widget>[
          ThemeSettings(),
          AppLanguageSelector(),
          FontSizeSlider(),
          ContactUsButton(),
        ],
      ),
    );
  }
}
