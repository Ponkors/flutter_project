import 'package:core_ui/design/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollableFoodMenu extends StatefulWidget {
  @override
  _ScrollableFoodMenuState createState() => _ScrollableFoodMenuState();
}

class _ScrollableFoodMenuState extends State<ScrollableFoodMenu> {
  List<String> foodMenu = ['Beef & Lamb', 'Seafood', 'Appetizers', 'Dim Sum'];
  int selectedCategoryIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Или Expanded
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.06,
      child: Scaffold(
        body: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: foodMenu.length,
          itemBuilder: (context, index) {
            bool isSelected = selectedCategoryIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategoryIndex = index;
                });
              },
              child: Container(
                width: 160,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  foodMenu[index],
                  style: TextStyle(
                    color: isSelected ? AppColors.black : AppColors.grey,
                    fontSize: 24,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
