import 'package:core_ui/design/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryFoodItem extends StatelessWidget {
  final String imagePath;
  final String foodName;

  const CategoryFoodItem({
    required this.imagePath,
    required this.foodName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imagePath,
          width: 160,
          height: 140,
        ),
        Text(foodName,
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300)),
        Text(
          '\$\$ ● Chinese',
          style: TextStyle(
              color: AppColors.grey,
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
