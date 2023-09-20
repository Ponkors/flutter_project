import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class WelcomeForm extends StatelessWidget {
  final String image;
  final String text;
  final String mainText;

  const WelcomeForm(
      {required this.image, required this.text, required this.mainText});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: WelcomeGraphicWidget(imagePath: image),
          ),
          Column(
            children: [
              // Todo: fix a top margin.
              WelcomeCardWidget(),
              Spacer(),
              WelcomeText(
                titleText: text,
                mainText: mainText,
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).pushNamed('main_screen');
                },
                child: WelcomeButtonWidget(() {
                  AutoRouter.of(context).pushNamed('home_page');
                }),
              ),
              SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}

final List<Map<String, dynamic>> pages = [
  {
    'image': ImagePaths.illustration1,
    'text': 'All your favourites',
    'mainText':
        'Order from the best local restaurants with easy, on-demand delivery.'
  },
  {
    'image': ImagePaths.illustration2,
    'text': 'Free delivery offers',
    'mainText':
        'Free delivery for new customers via Apple Pay and other payment methods',
  },
  {
    'image': ImagePaths.illustration3,
    'text': 'Choose your food',
    'mainText':
        "Easily find your type of food craving and you'll get delivery in wide range",
  }
];

class WelcomeFormScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: pages.length,
      itemBuilder: (context, index) {
        return WelcomeForm(
          image: pages[index]['image'],
          text: pages[index]['text'],
          mainText: pages[index]['mainText'],
        );
      },
    );
  }
}
