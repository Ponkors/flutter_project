import 'package:core_ui/core_ui.dart';
import 'package:core_ui/design/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantPropertiesWidget extends StatelessWidget {
  const RestaurantPropertiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.25,
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppDimens.padding_10,
                ),
                Text(
                  'Mayfield Bakery & Cafe',
                  style: GoogleFonts.gothicA1(textStyle: AppFonts.s24_w600),
                ),
                Text(
                  '\$\$ ● Chinese ● American ● Deshi food',
                  style: GoogleFonts.gothicA1(
                    textStyle: AppFonts.s16_w400,
                    color: AppColors.grey,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Text(
                      '4.3',
                      style: GoogleFonts.gothicA1(textStyle: AppFonts.s12_w300),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.star,
                      color: AppColors.yellow,
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    Text(
                      '200+ Ratings',
                      style: GoogleFonts.gothicA1(
                        textStyle: AppFonts.s12_w300,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 45,
                ),
                Row(
                  children: [
                    Image.asset(
                      ImagePaths.deliveryIcon,
                    ),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Free',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          'Delivery',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Image.asset(
                      ImagePaths.clockIcon,
                    ),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '25',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          'Minutes',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            TempButtonWidget((){}, 'Take away'),
          ],
        ),
      ),
    );
  }
}
