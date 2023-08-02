// import 'package:core/core.dart';
// import 'package:data/models/menu_item_model.dart';

// class FirebaseProvider {
//   Future<List<MenuItemModel>> fetchMenuItems() async {
//     return await _getMenuItems();
//   }

//   Future<List<MenuItemModel>> _getMenuItems() async {
//     late final List<MenuItemModel> menuItems = [];

//     final fbMenu = (await FirebaseFirestore.instance.collection('menu').get())
//         .docs
//         .toList();

//     for (var fbItem in fbMenu) {
//       menuItems.add(MenuItemModel.fromJson(fbItem.data()));
//     }
//     return menuItems;
//   }
// }
