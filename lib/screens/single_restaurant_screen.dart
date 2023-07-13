import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

class SingleRestaurantScreen extends StatelessWidget {
  const SingleRestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SingleChildScrollView(
                child: Column(
          children: [
            RestaurantHeader(),
            RestaurantPropertiesWidget(),
            HorizontalFoodList(),
            ScrollableFoodMenu(),
            VerticalFoodList(),
          ],
        ))));
  }
}
