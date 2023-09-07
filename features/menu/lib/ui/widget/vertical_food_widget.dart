import 'package:core_ui/core_ui.dart';
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
        width: AppDimens.size_340,
        height: AppDimens.size_140,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imagePath,
              ),
              SizedBox(width: AppDimens.size_10),
              Container(
                  width: AppDimens.size_220,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            foodName,
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300),
                        ),
                        SizedBox(height: AppDimens.size_4),
                        Text(
                          foodContains,
                          maxLines: 2,
                          style: TextStyle(
                              color: AppColors.grey,
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: AppDimens.size_10),
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
                            SizedBox(width: AppDimens.size_63),
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
                      ],
                  ),
              ),
            ],
        ),
    );
  }
}
