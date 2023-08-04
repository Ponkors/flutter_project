import 'package:core_ui/core_ui.dart';
import 'category_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CategoryFoodList extends StatefulWidget {
  List<Widget> foods = [
    CategoryFoodItem(
        imagePath: ImagePaths.categoryFoodItem, foodName: 'The Halal Guys'),
    CategoryFoodItem(
        imagePath: ImagePaths.categoryFoodItem, foodName: 'The Halal Guys'),
    CategoryFoodItem(
        imagePath: ImagePaths.categoryFoodItem, foodName: 'The Halal Guys'),
    CategoryFoodItem(
        imagePath: ImagePaths.categoryFoodItem, foodName: 'The Halal Guys'),
    CategoryFoodItem(
        imagePath: ImagePaths.categoryFoodItem, foodName: 'The Halal Guys'),
    CategoryFoodItem(
        imagePath: ImagePaths.categoryFoodItem, foodName: 'The Halal Guys'),
  ];

  @override
  _CategoryFoodListState createState() => _CategoryFoodListState();
}

class _CategoryFoodListState extends State<CategoryFoodList> {
  int selectedCategoryIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // Wrap with Expanded to take available space
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Top Restaurants',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
              ),
            ),
            Expanded(
              // Wrap with Expanded to take available space
              child: GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemCount: widget.foods.length,
                itemBuilder: (context, index) {
                  return widget.foods[index];
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
