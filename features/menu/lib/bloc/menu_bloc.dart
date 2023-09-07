import 'package:domain/domain.dart';
import 'package:core/core.dart';

part 'menu_state.dart';
part 'menu_event.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final GetMenuListUseCase _getMenuListUseCase;
  final GetHeaderMenuListUseCase _getHeaderMenuListUseCase;
  final GetHorizontalMenuListUseCase _getHorizontalMenuListUseCase;

  MenuBloc({
    required GetMenuListUseCase getMenuListUseCase,
    required GetHeaderMenuListUseCase getHeaderMenuListUseCase,
    required GetHorizontalMenuListUseCase getHorizontalMenuListUseCase,

  })  : _getMenuListUseCase = getMenuListUseCase,
        _getHeaderMenuListUseCase = getHeaderMenuListUseCase,
        _getHorizontalMenuListUseCase = getHorizontalMenuListUseCase,
        super(const MenuState()) {
    on<LoadMenuList>(_getMenu);
    on<LoadHeaderMenuList>(_getHeaderMenu);
    on<LoadHorizontalMenuList>(_getHorizontalMenu);
    add(LoadMenuList(0));
    add(LoadHeaderMenuList(0));
    add(LoadHorizontalMenuList(0));
  }

  Future<void> _getMenu(LoadMenuList event, Emitter<MenuState> emit) async {
    try {
      emit(
        state.copyWith(isLoading: true, error: null),
      );
      final List<MenuItemEntity> dishes =
      await _getMenuListUseCase.execute(event.page);
      emit(state.copyWith(
          dishesList: [...state.dishesList, ...dishes],
          isLoading: false));
    } catch (e) {
      emit(
        state.copyWith(error: e, isLoading: false),
      );
    }
  }

  Future<void> _getHeaderMenu(LoadHeaderMenuList event, Emitter<MenuState> emit) async {
    try {
      emit(
        state.copyWith(isLoading: true, error: null),
      );
      final List<HeaderMenuItemEntity> headerImagesList =
      await _getHeaderMenuListUseCase.execute(event.page);
      emit(state.copyWith(
        headerImagesList: [...state.headerImagesList, ...headerImagesList],
        isLoading: false,
      ));
    } catch (e) {
      emit(
        state.copyWith(error: e, isLoading: false),
      );
    }
  }

  Future<void> _getHorizontalMenu(LoadHorizontalMenuList event, Emitter<MenuState> emit) async {
    try {
      emit(
        state.copyWith(isLoading: true, error: null),
      );
      final List<HorizontalMenuItemEntity> horizontalDishesList =
      await _getHorizontalMenuListUseCase.execute(event.page);
      emit(state.copyWith(
        horizontalDishesList: [...state.horizontalDishesList, ...horizontalDishesList],
        isLoading: false,
      ));
    } catch (e) {
      emit(
        state.copyWith(error: e, isLoading: false),
      );
    }
  }
}
