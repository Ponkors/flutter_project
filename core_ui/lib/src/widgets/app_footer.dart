import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 60,
            height: 60,
            child: Column(
              children: [
                Image.asset('assets/images/app_footer_images/home.png'),
                Text(
                  'Home',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 60,
            height: 60,
            child: Column(
              children: [
                Image.asset('assets/images/app_footer_images/search.png'),
                Text(
                  'Search',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 60,
            height: 60,
            child: Column(
              children: [
                Image.asset('assets/images/app_footer_images/orders.png'),
                Text(
                  'Orders',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 60,
            height: 60,
            child: Column(
              children: [
                Image.asset('assets/images/app_footer_images/profile.png'),
                Text(
                  'Profile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
