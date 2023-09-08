import 'package:core_ui/core_ui.dart';
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
    return Container(
      width: 160,
      height: 300,
      child:
      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imagePath,
          width: 160,
          height: 140,
          fit: BoxFit.cover,
        ),
         SizedBox(height: 10),
        Text(foodName,
            style: GoogleFonts.poppins(
              textStyle: AppFonts.s16_w400,
            )
        ),
        Text(
          '\$\$ ● Chinese',
          style: GoogleFonts.poppins(
            textStyle: AppFonts.s14_w400,
            color: AppColors.grey
          ),
        ),
      ],
    ));
  }
}
