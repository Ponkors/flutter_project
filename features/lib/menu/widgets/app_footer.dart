import 'package:core_ui/design/app_images.dart';
import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 60,
            height: 60,
            child: Column(
              children: [
                Image.asset(ImagePaths.homeIcon),
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
                Image.asset(ImagePaths.searchIcon),
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
                Image.asset(ImagePaths.ordersIcon),
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
                Image.asset(
                  ImagePaths.profileIcon,
                ),
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
