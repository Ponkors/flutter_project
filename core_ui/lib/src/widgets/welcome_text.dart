import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeText extends StatelessWidget {
  final String titleText;
  final String mainText;

  WelcomeText({required this.titleText, required this.mainText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      padding: EdgeInsets.only(left: 25, right: 25),
      height: 140,
      width: 400,
      child: Column(
        children: [
          Text(
            titleText,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 20),
          Text(
            mainText,
            textAlign: TextAlign.center,
            style: GoogleFonts.gothicA1(
              color: AppColors.black,
              textStyle: AppFonts.s16_w400,
            ),
          )
        ],
      ),
    );
  }
}
