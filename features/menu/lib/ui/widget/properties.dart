import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class RestaurantPropertiesWidget extends StatelessWidget {
  const RestaurantPropertiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            left: AppDimens.padding_20,
            right: AppDimens.padding_20,
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppDimens.padding_10),
                Text(
                  'Mayfield Bakery & Cafe',
                  style: GoogleFonts.gothicA1(
                      textStyle:AppFonts.s24_w600).copyWith(
                      color: AppColors.black
                  ),
                ),
                Text(
                  '\$\$ ● Chinese ● American ● Deshi food',
                  style: GoogleFonts.poppins(
                      textStyle: AppFonts.s16_w400).copyWith(
                      color: AppColors.grey
                  ),
                ),
                SizedBox(height: AppDimens.padding_16),
                Row(
                  children: <Widget> [
                    Text(
                      '4.3',
                      style: GoogleFonts.gothicA1(
                          textStyle: AppFonts.s12_w400
                      ),
                    ),
                    SizedBox(width: AppDimens.padding_10),
                    Icon(
                      Icons.star,
                      color: AppColors.yellow,
                      size: AppDimens.size_25,
                    ),
                    SizedBox(width: AppDimens.padding_10),
                    Text(
                      '200+ Ratings',
                      style: GoogleFonts.gothicA1(
                        textStyle: AppFonts.s12_w400,
                      ),
                    )
                  ],
                ),
                SizedBox(height: AppDimens.padding_45),
                Row(
                  children:[
                    Image.asset(
                      ImagePaths.deliveryIcon,
                    ),
                    SizedBox(width: AppDimens.padding_5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Free',
                          style: GoogleFonts.poppins(
                              textStyle: AppFonts.s16_w400
                          ),
                        ),
                        Text(
                          'Delivery',
                          style: GoogleFonts.poppins(
                              textStyle: AppFonts.s12_w400).copyWith(
                              color: AppColors.grey),
                        ),
                      ],
                    ),
                    SizedBox(width: AppDimens.padding_25),
                    Image.asset(
                      ImagePaths.clockIcon,
                    ),
                    SizedBox(width: AppDimens.padding_5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '25', //TODO problem with numbers at font "gothicA1"
                          style: GoogleFonts.poppins(
                              textStyle: AppFonts.s16_w400
                          ),
                        ),
                        Text(
                          'Minutes',
                          style: GoogleFonts.poppins(
                              textStyle: AppFonts.s12_w400).copyWith(
                              color: AppColors.grey),
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