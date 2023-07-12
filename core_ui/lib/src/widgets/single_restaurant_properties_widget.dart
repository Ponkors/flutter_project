import 'package:core_ui/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class RestaurantPropertiesWidget extends StatelessWidget {
  const RestaurantPropertiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.35,
      margin: EdgeInsets.only(left: 20, right: 20),
      color: Colors.red,
      child: Column(children: [
        Text(
          'Mayfield Bakery & Cafe',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          '\$\$ ● Chinese ● American ● Deshi food',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            color: AppColors.grey,
          ),
        )
      ]),
    );
  }
}
