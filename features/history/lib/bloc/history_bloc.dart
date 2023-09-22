import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'history_event.dart';
part 'history_state.dart';


class OrdersHistoryBloc extends Bloc<OrdersHistoryEvent, OrdersHistoryState> {
  final FetchOrdersHistoryUseCase _fetchOrdersHistoryUseCase;
  final AddOrdersHistoryUseCase _addOrdersHistoryUseCase;
  final GetUserFromStorageUseCase _getUserFromStorageUseCase;

  OrdersHistoryBloc({
    required FetchOrdersHistoryUseCase fetchOrdersHistoryUseCase,
    required AddOrdersHistoryUseCase addOrdersHistoryUseCase,
    required GetUserFromStorageUseCase getUserFromStorageUseCase,
  }) : _fetchOrdersHistoryUseCase = fetchOrdersHistoryUseCase,
       _addOrdersHistoryUseCase = addOrdersHistoryUseCase,
       _getUserFromStorageUseCase = getUserFromStorageUseCase,
       super(OrdersHistoryState.empty()) {
    on<LoadOrdersHistory>(_loadOrdersHistory);
    on<InitializeListOfOrdersHistory>(_initOrdersHistory);
    on<AddOrder>(_addOrder);
  }

  Future<void> _initOrdersHistory(
      InitializeListOfOrdersHistory event,
      Emitter<OrdersHistoryState> emit,
      ) async {
    if (state.orderItems.isEmpty) {
      emit(
        state.copyWith(isLoading: true),
      );
      add(LoadOrdersHistory());
    } else {
      emit(
        state.copyWith(isLoading: false),
      );
    }
  }

  Future<void> _addOrder(
      AddOrder event,
      Emitter<OrdersHistoryState> emit,
      ) async {
    await _addOrdersHistoryUseCase.execute(event.order);
    final List<OrdersHistoryModel> orders = List.from(state.orderItems)
      ..insert(0, event.order);
    emit(state.copyWith(orderItems: orders));
  }

  Future<void> _loadOrdersHistory(
      LoadOrdersHistory event,
      Emitter<OrdersHistoryState> emit,
      ) async {
    final UserModel userFromStorage = await _getUserFromStorageUseCase.execute(
      const NoParams(),
    );
    try {
      final List<OrdersHistoryModel> ordersList =
      await _fetchOrdersHistoryUseCase.execute(userFromStorage.identifierId);
      ordersList.isEmpty
          ? emit(
        state.copyWith(
          orderItems: [],
          isLoading: false,
        ),
      )
          : emit(
        state.copyWith(
          orderItems: ordersList,
          isLoading: false,
        ),
      );
    } catch (error) {
      emit(state.copyWith(exception: error));
    }
  }
}