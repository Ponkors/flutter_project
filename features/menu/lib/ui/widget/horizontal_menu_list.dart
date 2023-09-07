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
                  style: GoogleFonts.gothicA1(
                      textStyle: AppFonts.normal_20),
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
                            padding: EdgeInsets.only(
                                right: AppDimens.padding_20
                            ),
                            child: Column(
                              children: [
                                HorizontalMenuItem(
                                  name: itemModel.name,
                                  ingredients: itemModel.ingredients,
                                  image: itemModel.image,
                                  cost: itemModel.cost,
                                ),
                              ],
                            ),
                          );
                        }
                        ).toList(),
                  ),
                ),
              ),
            ],
        ),
    );
  }
}