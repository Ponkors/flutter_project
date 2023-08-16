import 'package:data/mappers/header_menu_item_mapper.dart';
import 'package:data/models/header_menu_item_model.dart';
import 'package:data/providers/firebase_provider.dart';
import 'package:domain/domain.dart';

class HeaderMenuItemRepository implements IHeaderMenuItemRepository {
  final FirebaseProvider _firebaseProvider;

  HeaderMenuItemRepository(this._firebaseProvider);

  @override
  Future<List<HeaderMenuItemEntity>> getHeaderMenuList(int page) async {
    final List<HeaderMenuItemModel> result = await _firebaseProvider.fetchHeaderMenuItems();
    return result.map((HeaderMenuItemModel e) => HeaderMenuItemMapper.toEntity(e)).toList();
  }
}