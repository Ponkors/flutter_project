import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 70, left: 25, right: 25),
      height: 120,
      width: 400,
      // color: Colors.red,
      child: Row(
        children: [
          SizedBox(
            height: 65,
            width: 65,
            child: SvgPicture.asset(ImagePaths.logoImage),
          ),
          SizedBox(width: 2.0),
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
