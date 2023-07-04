import 'package:flutter/material.dart';

class WelcomeTextWidget extends StatelessWidget {
  final String title;
  final String mainText;

  WelcomeTextWidget({required this.title, required this.mainText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      padding: EdgeInsets.only(left: 25, right: 25),
      height: 140,
      width: 400,
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 20),
          Text(
            mainText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
