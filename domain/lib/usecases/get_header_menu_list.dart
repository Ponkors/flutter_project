import 'package:domain/usecases/usecases.dart';

import '../entities/header_menu_item_entity.dart';
import '../repositories/header_menu_item_repository.dart';

class GetHeaderMenuListUseCase extends FutureUseCase<List<HeaderMenuItemEntity>, int> {
  final IHeaderMenuItemRepository headerMenuItemRepository;

  GetHeaderMenuListUseCase(this.headerMenuItemRepository);

  @override
  Future<List<HeaderMenuItemEntity>> execute(int input) async {
    return await headerMenuItemRepository.getHeaderMenuList(input);
  }

}
