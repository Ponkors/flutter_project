import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class WelcomeCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: AppDimens.padding_70,
          left: AppDimens.padding_25,
          right: AppDimens.padding_25
      ),
      height: AppDimens.size_120,
      width: AppDimens.size_400,
      child: Row(
        children: <Widget>[
          SizedBox(
            height: AppDimens.size_65,
            width: AppDimens.size_65,
            child: SvgPicture.asset(ImagePaths.logoImage),
          ),
          SizedBox(width: AppDimens.size_2),
          Expanded(
            child: Text(
              AppConstants.logoTitle,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(textStyle: AppFonts.s37_w700),
            ),
          ),
        ],
      ),
    );
  }
}
