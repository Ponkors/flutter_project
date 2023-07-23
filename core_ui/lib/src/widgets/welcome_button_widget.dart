import 'package:core_ui/design/app_colors.dart';
import 'package:flutter/material.dart';

class WelcomeButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const WelcomeButtonWidget(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: AppColors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(335, 48),
      ),
      child: Text(
        'GET STARTED',
        style: TextStyle(
          color: AppColors.white,
          fontSize: 14,
          // TODO check fontFamily
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
