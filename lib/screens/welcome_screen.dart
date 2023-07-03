import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
        home: Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: -100,
            top: -50,
            child: Container(
              width: 450,
              height: 450,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 243, 222, 1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Column(
            children: [
              WelcomeCardWidget(),
              SizedBox(height: 14),
              Image.asset(
                  'assets/images/welcome_screen_images/illustration.png'),
              SizedBox(height: 40),
              WelcomeTextWidget(),
              SizedBox(height: 40),
              WelcomeButtonWidget('GET STARTED', () {}),
            ],
          ),
        ],
      ),
    ));
  }
}
