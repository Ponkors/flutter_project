import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/app/flutter_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dataDI.initDependencies();
  appDi.initDependencies();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('pl', 'PL'),
        // Locale('ru', 'RU'), ToDo
      ],
      path: 'assets/translations',
      assetLoader: const CodegenLoader(),
      fallbackLocale: const Locale('en', 'US'),
      child: const FoodApp(),
    ),
  );
}
