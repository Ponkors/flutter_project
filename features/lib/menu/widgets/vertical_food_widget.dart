import 'package:core_ui/design/app_colors.dart';
import 'package:flutter/material.dart';

class VerticalFoodWidget extends StatelessWidget {
  final String imagePath;
  final String foodName;
  final String foodContains;
  final String price;

  const VerticalFoodWidget({
    required this.imagePath,
    required this.foodName,
    required this.foodContains,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 340,
        height: 140,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset(
            imagePath,
          ),
          SizedBox(width: 10),
          Container(
              width: 220,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(foodName,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300)),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      foodContains,
                      maxLines: 2,
                      style: TextStyle(
                          color: AppColors.grey,
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          '\$\$ ● Chinese',
                          style: TextStyle(
                              color: AppColors.grey,
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 63,
                        ),
                        Text(
                          price,
                          style: TextStyle(
                              color: AppColors.yellow,
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ])),
        ]));
  }
}
