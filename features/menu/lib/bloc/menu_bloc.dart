import 'package:domain/domain.dart';
import 'package:core/core.dart';
import 'dart:async';

part 'menu_state.dart';
part 'menu_event.dart';

class DishesBloc extends Bloc<DishesEvent, DishesState> {
  final FetchAllDishesUseCase _fetchAllDishesUseCase;
  StreamSubscription<ConnectivityResult>? streamSubscription;

  DishesBloc({
    required FetchAllDishesUseCase fetchAllDishesUseCase,
  })  : _fetchAllDishesUseCase = fetchAllDishesUseCase,
        super(DishesState()) {
    on<InitListOfDishes>(_initDishes);
    on<LoadListOfDishes>(_loadDishes);
    on<CheckInternetConnection>(_checkInternetConnection);

    add(InitListOfDishes());

    streamSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      add(CheckInternetConnection());
    });
  }

  Future<void> _initDishes(
      InitListOfDishes event,
      Emitter<DishesState> emit,
      ) async {
    add(CheckInternetConnection());
    if (state.listOfDishes.isEmpty) {
      emit(
        state.copyWith(isLoading: true),
      );
      add(LoadListOfDishes());
    } else {
      emit(
        state.copyWith(isLoading: false),
      );
    }
  }

  Future<void> _loadDishes(
      LoadListOfDishes event,
      Emitter<DishesState> emit,
      ) async {
    try {
      final List<DishModel> dishes = await _fetchAllDishesUseCase.execute(
        const NoParams(),
      );
      emit(
        state.copyWith(listOfDishes: dishes),
      );
    } catch (e) {
      emit(
        state.copyWith(exception: e),
      );
    }
  }

  Future<void> _checkInternetConnection(
      CheckInternetConnection event,
      Emitter<DishesState> emit,
      ) async {
    final bool haveInternetConnection =
    await InternetConnectionInfo.checkInternetConnection();
    emit(
      state.copyWith(haveInternetConnection: haveInternetConnection),
    );
  }
}
