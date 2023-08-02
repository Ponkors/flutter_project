import 'package:flutter/material.dart';
import 'package:core_ui/design/app_images.dart';

class WelcomeGraphicWidget extends StatelessWidget {
  final String imagePath;

  const WelcomeGraphicWidget({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath);
  }
}
