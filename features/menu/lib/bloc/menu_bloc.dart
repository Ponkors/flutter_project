import 'package:domain/domain.dart';
import 'package:core/core.dart';

part 'menu_state.dart';
part 'menu_event.dart';

// class CombinedMenuItems {
//   final List<MenuBloc> menuBloc;
//   final List<HorizontalMenuBloc> horizontalMenuBloc;
//
//   CombinedMenuItems(this.menuBloc, this.horizontalMenuBloc);
// }


class HeaderMenuBloc extends Bloc<HeaderMenuEvent, HeaderMenuState> {
  final GetHeaderMenuListUseCase _getHeaderMenuListUseCase;

  HeaderMenuBloc({
    required GetHeaderMenuListUseCase getHeaderMenuListUseCase,
  }) : _getHeaderMenuListUseCase = getHeaderMenuListUseCase,
        super(const HeaderMenuState()) {
    on<LoadHeaderMenuList>(_getHeaderMenu);
    add(LoadHeaderMenuList(0));
  }

  Future<void> _getHeaderMenu(LoadHeaderMenuList event, Emitter<HeaderMenuState> emit) async {
    try {
      emit(
        state.copyWith(isLoading: true, error: null),
      );
      final List<HeaderMenuItemEntity> dishes =
      await _getHeaderMenuListUseCase.execute(event.page);
      emit(state.copyWith(
          imagesList: [...state.imagesList, ...dishes], isLoading: false));
    } catch (e) {
      emit(
        state.copyWith(error: e, isLoading: false),
      );
    }
  }
}

class HorizontalMenuBloc extends Bloc<HorizontalMenuEvent, HorizontalMenuState> {
  final GetHorizontalMenuListUseCase _getHorizontalMenuListUseCase;

  HorizontalMenuBloc({
    required GetHorizontalMenuListUseCase getHorizontalMenuListUseCase,
  }) : _getHorizontalMenuListUseCase = getHorizontalMenuListUseCase,
       super(const HorizontalMenuState()) {
    on<LoadHorizontalMenuList>(_getHorizontalMenu);
    add(LoadHorizontalMenuList(0));
  }

  Future<void> _getHorizontalMenu(LoadHorizontalMenuList event, Emitter<HorizontalMenuState> emit) async {
    try {
      emit(
        state.copyWith(isLoading: true, error: null),
      );
      final List<HorizontalMenuItemEntity> dishes =
      await _getHorizontalMenuListUseCase.execute(event.page);
      emit(state.copyWith(
          dishesList: [...state.dishesList, ...dishes], isLoading: false));
    } catch (e) {
      emit(
        state.copyWith(error: e, isLoading: false),
      );
    }
  }
}


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
