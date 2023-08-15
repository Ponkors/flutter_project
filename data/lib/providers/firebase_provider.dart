import 'package:core/core.dart';
import 'package:data/models/menu_item_model.dart';
import 'package:data/models/horizontal_menu_item_model.dart';

class FirebaseProvider {

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
