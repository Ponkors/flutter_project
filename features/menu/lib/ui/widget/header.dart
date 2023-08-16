import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'header_item.dart';

class RestaurantHeader extends StatefulWidget {
  final List<HeaderMenuItemEntity> _itemModels;
  const RestaurantHeader(this._itemModels, {super.key});

  @override
  State<StatefulWidget> createState() => RestaurantHeaderState();
}

class RestaurantHeaderState extends State<RestaurantHeader> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: widget._itemModels.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page.toInt();
              });
            },
            itemBuilder: (context, index) {
              HeaderMenuItemEntity itemModel = widget._itemModels[index];
              return Container(
                child: HeaderImageItem(
                  image: itemModel.image,
                ),
              );
            },
          ),
          Positioned(
            top: 30,
            left: 20,
            child: Row(
              children: [
                CupertinoButton(
                  onPressed: () {
                    context.router.pop();
                  },
                  padding: EdgeInsets.zero,
                  child: Icon(
                    CupertinoIcons.back,
                    color: AppColors.white,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 30,
            right: 20,
            child: Row(
              children: [
                CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: Icon(
                    CupertinoIcons.share,
                    color: AppColors.white,
                  ),
                ),
                CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: Icon(
                    CupertinoIcons.search,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: DotsIndicator(
              dotsCount: widget._itemModels.length,
              position: _currentPage.toInt(),
              decorator: DotsDecorator(
                size: Size(8,5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
                activeColor: AppColors.white,
                activeSize: Size(8,5),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}


// import 'package:core_ui/core_ui.dart';
// import 'package:domain/domain.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:navigation/navigation.dart';
//
// import 'header_item.dart';
//
// class RestaurantHeader extends StatefulWidget {
//   final List<HeaderMenuItemEntity> _itemModels;
//
//   const RestaurantHeader(this._itemModels, {super.key});
//
//   @override
//   State<RestaurantHeader> createState() => _RestaurantHeaderState();
// }
//
// class _RestaurantHeaderState extends State<RestaurantHeader> {
//   int _currentPage = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height * 0.4,
//       child: Stack(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height * 0.4,
//             child: PageView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: widget._itemModels.length,
//               onPageChanged: (int index) {
//                 setState(() {
//                   _currentPage = index;
//                 });
//               },
//               itemBuilder: (BuildContext context, int index) {
//                 return Container(
//                   width: MediaQuery.of(context).size.width,
//                   child: widget._itemModels
//                       .asMap()
//                       .entries
//                       .map((entry) {
//                     int index = entry.key;
//                     HeaderMenuItemEntity itemModel = entry.value;
//                   ),
//                 );
//               },
//             ),
//           ),
//           Positioned(
//             top: 30,
//             left: 20,
//             child: Row(
//               children: [
//                 CupertinoButton(
//                   onPressed: () {
//                     context.router.pop();
//                   },
//                   padding: EdgeInsets.zero,
//                   child: Icon(
//                     CupertinoIcons.back,
//                     color: AppColors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             top: 30,
//             right: 20,
//             child: Row(
//               children: [
//                 CupertinoButton(
//                   onPressed: () {},
//                   padding: EdgeInsets.zero,
//                   child: Icon(
//                     CupertinoIcons.share,
//                     color: AppColors.white,
//                   ),
//                 ),
//                 CupertinoButton(
//                   onPressed: () {},
//                   padding: EdgeInsets.zero,
//                   child: Icon(
//                     CupertinoIcons.search,
//                     color: AppColors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//               bottom: 20,
//               right: 20,
//               child: DotsIndicator(
//                 dotsCount: _images.length,
//                 position: _currentPage.toInt(),
//                 decorator: DotsDecorator(
//                     size: Size(8, 5),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(6)),
//                     activeColor: AppColors.white,
//                     activeSize: Size(8, 5),
//                     activeShape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(6),
//                     )),
//               )),
//         ],
//       ),
//     );
//   }
// }
