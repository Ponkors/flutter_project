import 'package:flutter/material.dart';

class WelcomeCardWidget extends StatelessWidget {
  final String imagePath;
  final String title;

  WelcomeCardWidget(
      {this.imagePath = 'assets/images/welcome_screen_images/emblem.png',
      this.title = 'Tamang\nFoodService'});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 95, left: 25, right: 25),
      height: 120,
      width: 400,
      // color: Colors.red,
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: 65,
            width: 65,
            alignment: Alignment.topLeft,
          ),
          SizedBox(width: 2.0),
          Expanded(
            child: Text(
              title,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 37,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 1.1),
            ),
          ),
        ],
      ),
    );
  }
}
