import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class WalkthroughScreen extends StatelessWidget {
  final String image;
  final String text;
  final String mainText;

  const WalkthroughScreen(
      {required this.image, required this.text, required this.mainText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            WelcomeCardWidget(),
            Spacer(),
            WelcomeGraphicWidget(imagePath: image),
            Spacer(),
            WelcomeTextWidget(
              mainText: mainText,
              title: text,
            ),
            SizedBox(
              height: 10,
            ),
            WelcomeButtonWidget(() {}),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> pages = [
  {
    'image': 'assets/images/walkthrough_screen_images/illustration1.png',
    'text': 'All your favourites',
    'mainText':
        'Order from the best local restaurants with easy, on-demand delivery.'
  },
  {
    'image': 'assets/images/walkthrough_screen_images/illustration2.png',
    'text': 'Free delivery offers',
    'mainText':
        'Free delivery for new customers via Apple Pay and other payment methods',
  },
  {
    'image': 'assets/images/walkthrough_screen_images/illustration3.png',
    'text': 'Choose your food',
    'mainText':
        "Easily find your type of food craving and you'll get delivery in wide range",
  }
];

class WalkthroughScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: pages.length,
      itemBuilder: (context, index) {
        return WalkthroughScreen(
          image: pages[index]['image'],
          text: pages[index]['text'],
          mainText: pages[index]['mainText'],
        );
      },
    );
  }
}
