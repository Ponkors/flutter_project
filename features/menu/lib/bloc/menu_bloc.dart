import 'package:domain/domain.dart';
import 'package:core/core.dart';

part 'menu_state.dart';
part 'menu_event.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final GetMenuListUseCase _getMenuListUsecase;

  MenuBloc({
    required GetMenuListUseCase getMenuListUsecase,
  })  : _getMenuListUsecase = getMenuListUsecase,
        super(const MenuState()) {
    on<LoadMenuList>(_getMenu);
    add(LoadMenuList(0));
  }

  Future<void> _getMenu(LoadMenuList event, Emitter<MenuState> emit) async {
    try {
      emit(
        state.copyWith(isLoading: true, error: null),
      );
      final List<MenuItemEntity> dishes =
      await _getMenuListUsecase.execute(event.page);
      emit(state.copyWith(
          dishesList: [...state.dishesList, ...dishes], isLoading: false));
    } catch (e) {
      emit(
        state.copyWith(error: e, isLoading: false),
      );
    }
  }
}
