import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';
import 'package:auto_route/auto_route.dart';

class HomeForm extends StatelessWidget {
  const HomeForm({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            left: -AppDimens.size_100,
            top: -50,
            child: Container(
              width: AppDimens.size_450,
              height: AppDimens.size_450,
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
              imagePath: ImagePaths.homeImage,
            ),
          ),
          Column(
            children: <Widget>[
              WelcomeCardWidget(),
              Spacer(),
              HomeTextWidget(
                titleText: AppConstants.welcomeTitle,
                mainText: AppConstants.welcomeText,
              ),
              SizedBox(height: AppDimens.size_40),
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).pushNamed('welcome_screens');
                },
                child: WelcomeButtonWidget(() {
                  AutoRouter.of(context).pushNamed('welcome_screens');
                }
                ),
              ),
              SizedBox(height: AppDimens.size_30),
            ],
          ),
        ],
      ),
    );
  }
}
