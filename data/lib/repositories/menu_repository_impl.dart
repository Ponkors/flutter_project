import 'package:data/mappers/menu_item_mapper.dart';
import 'package:data/models/menu_item_model.dart';
import 'package:data/providers/firebase_provider.dart';
import 'package:domain/domain.dart';

class MenuItemRepository implements IMenuItemRepository {
  final FirebaseProvider _firebaseProvider;

  MenuItemRepository(this._firebaseProvider);

  @override
  Future<List<MenuItemEntity>> getMenuList(int page) async {
    final List<MenuItemModel> result = await _firebaseProvider.fetchMenuItems();
    return result.map((MenuItemModel e) => MenuItemMapper.toEntity(e)).toList();
  }
}
