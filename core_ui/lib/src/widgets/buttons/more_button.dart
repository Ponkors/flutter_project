import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.radius_30),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: AppDimens.size_1,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            ImagePaths.plusIcon,
            colorFilter: ColorFilter.mode(
              Theme.of(context).primaryColor,
            BlendMode.srcIn
            ),
          )
        ),
      ),
    );
  }
}
