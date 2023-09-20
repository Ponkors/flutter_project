import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/app/flutter_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dataDI.initDependencies();
  appDi.initDependencies();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('pl', 'PL'),
        Locale('ru', 'RU'),
      ],
      path: 'assets/translations',
      assetLoader: const CodegenLoader(),
      fallbackLocale: const Locale('en', 'US'),
      child: const FoodApp(),
    ),
  );
}
