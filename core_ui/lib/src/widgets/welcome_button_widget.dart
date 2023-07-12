import 'package:flutter/material.dart';

class WelcomeButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const WelcomeButtonWidget(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Color(0xFFEEA734),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(335, 48),
      ),
      child: Text(
        'GET STARTED',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          // TODO check fontFamily
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
