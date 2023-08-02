import 'package:core_ui/core_ui.dart';
import 'package:core_ui/design/app_colors.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      AppConstants.labelOrders,
      style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.black),
    ));
  }
}
