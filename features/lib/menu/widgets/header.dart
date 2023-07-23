import 'package:core_ui/design/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class RestaurantHeader extends StatefulWidget {
  @override
  _RestaurantHeaderState createState() => _RestaurantHeaderState();
}

class _RestaurantHeaderState extends State<RestaurantHeader> {
  List<String> _images = [
    'assets/images/single_restaurant_screen_images/header-image.png',
    'assets/images/single_restaurant_screen_images/header-image2.png',
    'assets/images/single_restaurant_screen_images/header-image3.png',
  ];
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _images.length,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    _images[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 30,
            left: 20,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back),
                    color: AppColors.white)
              ],
            ),
          ),
          Positioned(
            top: 30,
            right: 20,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                  color: AppColors.white,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                    color: AppColors.white),
              ],
            ),
          ),
          Positioned(
              bottom: 20,
              right: 20,
              child: DotsIndicator(
                dotsCount: _images.length,
                position: _currentPage.toInt(),
                decorator: DotsDecorator(
                    size: Size(8, 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    activeColor: AppColors.white,
                    activeSize: Size(8, 5),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    )),
              )),
        ],
      ),
    );
  }
}
