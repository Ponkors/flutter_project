import 'package:core_ui/design/app_colors.dart';
import 'package:flutter/material.dart';

class HorizontalFoodWidget extends StatelessWidget {
  final String imagePath;
  final String foodName;

  const HorizontalFoodWidget({
    required this.imagePath,
    required this.foodName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            width: 140,
            height: 140,
          ),
          SizedBox(width: 10),
          Text(foodName,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300)),
          SizedBox(
            height: 4,
          ),
          Text(
            '\$\$ ● Chinese',
            style: TextStyle(
                color: AppColors.grey,
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
