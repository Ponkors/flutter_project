import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'menu_item.dart';

class MenuList extends StatefulWidget {
  final List<MenuItemEntity> _itemModels;
  const MenuList(this._itemModels, {super.key});

  @override
  State<StatefulWidget> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(AppDimens.padding_25),
        child: ListView.separated(
          itemCount: widget._itemModels.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                AutoRouter.of(context).push(
                  DishRoute(model: widget._itemModels[index]),
                );
              },
              child: MenuItem(
                name: widget._itemModels[index].name,
                ingredients: widget._itemModels[index].ingredients,
                image: widget._itemModels[index].image,
                cost: widget._itemModels[index].cost,
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(height: AppDimens.padding_10);
          },
        ),
      ),
    );
  }
}
