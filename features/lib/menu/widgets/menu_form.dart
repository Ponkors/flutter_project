import 'package:flutter/material.dart';
import 'package:features/menu/widgets/header.dart';
import 'package:features/menu/widgets/properties.dart';
import 'package:features/menu/widgets/horizontal_food_list.dart';
import 'package:features/menu/widgets/food_menu_widget.dart';
import 'package:features/menu/widgets/vertical_food_list.dart';
import 'package:features/menu/widgets/app_footer.dart';

class MenuForm extends StatelessWidget {
  const MenuForm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    RestaurantHeader(),
                    RestaurantPropertiesWidget(),
                    HorizontalFoodList(),
                    ScrollableFoodMenu(),
                    VerticalFoodList(),
                    VerticalFoodList(),
                  ],
                ),
              ),
            ),
            AppFooter(),
          ],
        ),
      ),
    );
  }
}
