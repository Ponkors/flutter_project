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

  void updateHeaderPageIndicator(int page) {
    setState(() {
      _currentPage = page.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: widget._itemModels.length,
            onPageChanged: updateHeaderPageIndicator,
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
            top: AppDimens.padding_30,
            left: AppDimens.padding_20,
            child: Row(
              children: <Widget>[
                CupertinoButton(
                  onPressed: () {
                    context.router.pop();
                  },
                  padding: EdgeInsets.zero,
                  child: Icon(
                    CupertinoIcons.back,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: AppDimens.padding_30,
            right: AppDimens.padding_20,
            child: Row(
              children: <Widget>[
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
            bottom: AppDimens.padding_20,
            right: AppDimens.padding_20,
            child: DotsIndicator(
              dotsCount: widget._itemModels.length,
              position: _currentPage.toInt(),
              decorator: DotsDecorator(
                size: Size(AppDimens.size_8, AppDimens.size_5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimens.radius_6)),
                activeColor: AppColors.white,
                activeSize: Size(AppDimens.size_8, AppDimens.size_5),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimens.radius_6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}