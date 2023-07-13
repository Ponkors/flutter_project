import 'package:core_ui/src/theme/app_colors.dart';
import 'package:core_ui/src/widgets/horizontal_food_widget.dart';
import 'package:core_ui/src/widgets/vertical_food_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class VerticalFoodList extends StatefulWidget {
  List<Widget> foods = [
    VerticalFoodWidget(
      imagePath: 'assets/images/popular_food_list_images/ComboBurger.png',
      foodName: 'ComboBurger',
      foodContains: 'Shortbread, chocolate turtle cookies, and red velvet.',
      price: 'AUD \$10',
    ),
    VerticalFoodWidget(
      imagePath: 'assets/images/popular_food_list_images/ComboBurger.png',
      foodName: 'ComboBurger',
      foodContains: 'Shortbread, chocolate turtle cookies, and red velvet.',
      price: 'AUD \$10',
    ),
    VerticalFoodWidget(
      imagePath: 'assets/images/popular_food_list_images/ComboBurger.png',
      foodName: 'ComboBurger',
      foodContains: 'Shortbread, chocolate turtle cookies, and red velvet.',
      price: 'AUD \$10',
    ),
  ];

  @override
  _VerticalFoodListState createState() => _VerticalFoodListState();
}

class _VerticalFoodListState extends State<VerticalFoodList> {
  int selectedCategoryIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Most Populars',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: widget.foods.map((food) => food).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
