import 'package:firebase_core/firebase_core.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:features/features.dart';
import 'package:food_app/app/flutter_app.dart';
import 'package:core/config/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await MenuDI.initDependencies();
  runApp(const FlutterApp());
}
