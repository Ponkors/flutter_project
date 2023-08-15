import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'horizontal_menu_item.dart';

class HorizontalMenuList extends StatefulWidget {
  final List<HorizontalMenuItemEntity> _itemModels;
  const HorizontalMenuList(this._itemModels, {super.key});

  @override
  State<StatefulWidget> createState() => _HorizontalMenuListState();
}

class _HorizontalMenuListState extends State<HorizontalMenuList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppDimens.padding_20),
            child: Text(
              AppConstants.featuredItems,
              style: GoogleFonts.gothicA1(textStyle: AppFonts.normal_20),
          ),
        ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
        padding: const EdgeInsets.only(left: AppDimens.padding_20),
          child: Row(
          children: widget._itemModels
              .asMap()
              .entries
              .map((entry) {
            int index = entry.key;
            HorizontalMenuItemEntity itemModel = entry.value;
            return Padding(
              padding: EdgeInsets.only(right: AppDimens.padding_20), // Добавляет отступ между элементами, суммарно будет 15
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // ToDo
                    },
                    child: HorizontalMenuItem(
                      name: itemModel.name,
                      ingredients: itemModel.ingredients,
                      image: itemModel.image,
                      cost: itemModel.cost,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
      )
    ]));
  }
}








/*
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'horizontal_menu_item.dart';

class HorizontalMenuList extends StatefulWidget {
  final List<HorizontalMenuItemEntity> _itemModels;
  const HorizontalMenuList(this._itemModels, {super.key});

  @override
  State<StatefulWidget> createState() => _HorizontalMenuListState();
}

class _HorizontalMenuListState extends State<HorizontalMenuList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: MediaQuery
          .of(context)
          .size
          .width,
      padding: const EdgeInsets.all(AppDimens.padding_20),
      child: Row(
        children: widget._itemModels
            .asMap()
            .entries
            .map((entry) {
          int index = entry.key;
          HorizontalMenuItemEntity itemModel = entry.value;
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  // ToDo
                },
                child: HorizontalMenuItem(
                  name: itemModel.name,
                  ingredients: itemModel.ingredients,
                  image: itemModel.image,
                  cost: itemModel.cost,
                ),
              ),
              ],
          );
        },).toList(),
      ),
    );
  }
}
*/







/*
import 'package:core_ui/core_ui.dart';
import 'package:menu/ui/widget/horizontal_food_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HorizontalFoodList extends StatefulWidget {
  List<Widget> foods = [
    HorizontalFoodWidget(
        imagePath: ImagePaths.foodImage2, foodName: 'Cookie Sandwich'),
    HorizontalFoodWidget(
        imagePath: ImagePaths.foodImage2, foodName: 'Cookie Sandwich'),
    HorizontalFoodWidget(
        imagePath: ImagePaths.foodImage2, foodName: 'Cookie Sandwich'),
  ];

  @override
  _HorizontalFoodListState createState() => _HorizontalFoodListState();
}

class _HorizontalFoodListState extends State<HorizontalFoodList> {
  int selectedCategoryIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.35,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Text(
                'Featured Items',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(left: 20),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.foods.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedCategoryIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategoryIndex = index;
                      });
                    },
                    child: Container(
                      width: 155,
                      height: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                      child: widget.foods[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


 */
