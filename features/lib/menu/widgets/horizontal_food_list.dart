import 'package:core_ui/design/app_colors.dart';
import 'package:features/menu/widgets/horizontal_food_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HorizontalFoodList extends StatefulWidget {
  List<Widget> foods = [
    HorizontalFoodWidget(
        imagePath:
            'assets/images/feautured_food_list_images/CookieSandwich.png',
        foodName: 'Cookie Sandwich'),
    HorizontalFoodWidget(
        imagePath:
            'assets/images/feautured_food_list_images/CookieSandwich.png',
        foodName: 'Cookie Sandwich'),
    HorizontalFoodWidget(
        imagePath:
            'assets/images/feautured_food_list_images/CookieSandwich.png',
        foodName: 'Cookie Sandwich'),
  ];

  @override
  _HorizontalFoodListState createState() => _HorizontalFoodListState();
}

class _HorizontalFoodListState extends State<HorizontalFoodList> {
  int selectedCategoryIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.35,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Text(
                'Featured Items',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(left: 20),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.foods.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedCategoryIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategoryIndex = index;
                      });
                    },
                    child: Container(
                      width: 155,
                      height: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                      child: widget.foods[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
