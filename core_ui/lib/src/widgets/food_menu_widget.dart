import 'package:core_ui/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollableFoodMenu extends StatefulWidget {
  const ScrollableFoodMenu({super.key});

  @override
  _ScrollableFoodMenuState createState() => _ScrollableFoodMenuState();
}

class _ScrollableFoodMenuState extends State<ScrollableFoodMenu> {
  List<String> foodMenu = ['Word1', 'Word2', 'Word3', 'Word4'];
  int selectedCategoryIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          foodMenu.length,
          (index) {
            bool isSelected = selectedCategoryIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategoryIndex = index;
                });
              },
              child: Text(
                foodMenu[index],
                style: TextStyle(
                  color: isSelected ? AppColors.black : AppColors.grey,
                  fontSize: 24,
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}
