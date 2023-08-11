import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class LessButton extends StatelessWidget {
  const LessButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.radius_30),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 1.0,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            ImagePaths.minusIcon,
            colorFilter: ColorFilter.mode(
              Theme.of(context).primaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
