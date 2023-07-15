import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter_project/screens/walkthrough_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
                    /* TODO: Color from AppColor(core_ui package) is not similar like
                    a color in Figma. This is a temporary fix */
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned.fill(
                child: WelcomeGraphicWidget(
                    imagePath:
                        'assets/images/welcome_screen_images/illustration.png'),
              ),
              Column(
                children: [
                  WelcomeCardWidget(),
                  Spacer(),
                  WelcomeTextWidget(
                      title: 'Welcome',
                      mainText:
                          "It's a pleasure to meet you. We are excited that you're here so let's get started!"),
                  SizedBox(height: 40),
                  WelcomeButtonWidget(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WalkthroughScreenView(),
                        ));
                  }),
                  SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ));
  }
}
