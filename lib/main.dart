import 'package:core/config/firebase_options.dart';
import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/app/flutter_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await dataDI.initDependencies();
  await appLocator<HiveProvider>().openBoxes();
  initNavigationDependencies();
  runApp(const FlutterApp());
}







// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:food_app/app/flutter_app.dart';
// import 'package:core/config/firebase_options.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//
//   // await MenuDI.initDependencies();
//   runApp(const FlutterApp());
// }
