import 'package:core_ui/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TempButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const TempButtonWidget(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: AppColors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(115, 40),
      ),
      child: Text(
        'TAKE AWAY',
        style: TextStyle(
          color: AppColors.white,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
