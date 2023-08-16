import 'package:core/core.dart';
import 'package:data/models/menu_item_model.dart';
import 'package:data/models/horizontal_menu_item_model.dart';
import 'package:data/models/header_menu_item_model.dart';

class FirebaseProvider {

  Future<List<HeaderMenuItemModel>> fetchHeaderMenuItems() async {
    return await _getHeaderMenuItems();
  }

  Future<List<HeaderMenuItemModel>> _getHeaderMenuItems() async {
    late final List<HeaderMenuItemModel> headerMenuItems = [];

    final fbHeaderMenu = (await FirebaseFirestore.instance.collection('header-images').get())
      .docs
      .toList();

    for(var fbHeaderItem in fbHeaderMenu){
      headerMenuItems.add(HeaderMenuItemModel.fromJson(fbHeaderItem.data()));
    }
    return headerMenuItems;
  }

  // --------------------------------------------------------------------------

  Future<List<HorizontalMenuItemModel>> fetchHorizontalMenuItems() async {
    return await _getHorizontalMenuItems();
  }

  Future<List<HorizontalMenuItemModel>> _getHorizontalMenuItems() async {
    late final List<HorizontalMenuItemModel> horizontalMenuItems = [];

    final fbHorizontalMenu = (await FirebaseFirestore.instance.collection('horizontal_menu').get())
        .docs
        .toList();


    for (var fbHorizontalItem in fbHorizontalMenu){
      horizontalMenuItems.add(HorizontalMenuItemModel.fromJson(fbHorizontalItem.data()));
    }
    return horizontalMenuItems;
    // for (var fbHorizontalItem in fbHorizontalMenu) {
    //   horizontalMenuItems.add(HorizontalMenuItemModel.fromJson(fbHorizontalItem.data()));
    // }
    // return horizontalMenuItems;
  }

  // --------------------------------------------------------------------------

  Future<List<MenuItemModel>> fetchMenuItems() async {
     return await _getMenuItems();
  }

  Future<List<MenuItemModel>> _getMenuItems() async {
      late final List<MenuItemModel> menuItems = [];

    final fbMenu = (await FirebaseFirestore.instance.collection('menu').get())
        .docs
        .toList();


    for (var fbItem in fbMenu) {
      menuItems.add(MenuItemModel.fromJson(fbItem.data()));
    }
    return menuItems;
  }
}
