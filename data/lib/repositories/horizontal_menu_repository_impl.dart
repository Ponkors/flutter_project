import 'package:data/mappers/horizontal_menu_item_mapper.dart';
import 'package:data/models/horizontal_menu_item_model.dart';
import 'package:data/providers/firebase_provider.dart';
import 'package:domain/domain.dart';

class HorizontalMenuItemRepository implements IHorizontalMenuItemRepository {
  final FirebaseProvider _firebaseProvider;

  HorizontalMenuItemRepository(this._firebaseProvider);

  @override
  Future<List<HorizontalMenuItemEntity>> getHorizontalMenuList(int page) async {
    final List<HorizontalMenuItemModel> result =
        await _firebaseProvider.fetchHorizontalMenuItems();
    return result
        .map((HorizontalMenuItemModel e) => HorizontalMenuItemMapper.toEntity(e))
        .toList();
  }
}
