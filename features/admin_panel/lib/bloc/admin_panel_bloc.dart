import 'package:authentication/authentication.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'admin_panel_event.dart';
part 'admin_panel_state.dart';

class AdminPanelBloc extends Bloc<AdminPanelEvent, AdminPanelState> {
  final DeleteDishUseCase _deleteDishUseCase;
  // final UpdateDishUseCase _updateDishUseCase;
  final FetchAllDishesUseCase _fetchAllDishesUseCase;
  final FetchAllUsersUseCase _fetchAllUsersUseCase;
  final FetchAllOrdersUseCase _fetchAllOrdersUseCase;
  final UpdateOrderStatusUseCase _updateOrderStatusUseCase;
  final UpdateUserRoleUseCase _updateUserRoleUseCase;
  final AppRouter _appRouter;

  AdminPanelBloc({
    required DeleteDishUseCase deleteDishUseCase,
    // required UpdateDishUseCase updateDishUseCase,
    required FetchAllDishesUseCase fetchAllDishesUseCase,
    required FetchAllUsersUseCase fetchAllUsersUseCase,
    required FetchAllOrdersUseCase fetchAllOrdersUseCase,
    required UpdateOrderStatusUseCase updateOrderStatusUseCase,
    required UpdateUserRoleUseCase updateUserRoleUseCase,
    required AppRouter appRouter,
  }): _deleteDishUseCase = deleteDishUseCase,
      // _updateDishUseCase = updateDishUseCase,
      _fetchAllDishesUseCase = fetchAllDishesUseCase,
      _fetchAllUsersUseCase = fetchAllUsersUseCase,
      _fetchAllOrdersUseCase = fetchAllOrdersUseCase,
      _updateOrderStatusUseCase = updateOrderStatusUseCase,
      _updateUserRoleUseCase = updateUserRoleUseCase,
      _appRouter = appRouter,
      super(AdminPanelState.empty()) {
    on<LoadDishes>(_loadDishes);
    // on<UpdateDish>(_updateDish);
    on<DeleteDish>(_deleteDish);
    on<LoadUsers>(_loadUsers);
    on<UpdateUserRole>(_updateUserRole);
    on<InitOrders> (_initOrders);
    on<UpdateOrderStatus>(_updateOrderStatus);
    on<LoadOrders> (_loadOrders);
    on<NavigateToBackScreen>(_navigateToBackScreen);
    add(const LoadDishes());
    add(const LoadUsers());
    add(const InitOrders());
    add(const LoadOrders());
  }

  Future<void> _initOrders(
    InitOrders event,
    Emitter<AdminPanelState> emit,
  ) async {
    if (state.dishesList.isEmpty) {
      emit(
        state.copyWith(isLoading: true),
      );
      add(const LoadOrders());
    } else {
      emit(
        state.copyWith(isLoading: false),
      );
    }
  }

  Future<void> _loadDishes(
    LoadDishes event,
    Emitter<AdminPanelState> emit,
  ) async {
    try {
      final List<DishModel> dishes = await _fetchAllDishesUseCase.execute(
        const NoParams(),
      );
      final List<String> categories = dishes
        .map((dish) {
          return dish.category ?? '';
        })
        .toSet()
        .toList();
      emit(
        state.copyWith(
          dishesList: dishes,
          categories: categories,
        ),
      );
    } on FirebaseException catch (error) {
      emit(
        state.copyWith(exception: error.message),
      );
    }
  }

  // Future<void> _updateDish(
  //   UpdateDish event,
  //   Emitter<AdminPanelState> emit,
  // ) async {
  //   try {
  //     await _updateDishUseCase.execute(event.dishModel);
  //     add(const LoadDishes());
  //     emit(state.copyWith(imageUrl: ''));
  //   } on FirebaseException catch (error) {
  //     emit(
  //       state.copyWith(exception: error.message),
  //     );
  //   }
  // }

  Future<void> _loadUsers(
    LoadUsers event,
    Emitter<AdminPanelState> emit,
  ) async {
    try {
      final List<UserModel> users = await _fetchAllUsersUseCase.execute(
        const NoParams(),
      );
      emit(
        state.copyWith(
          usersList: users,
          numberOfUsers: users.length,
        ),
      );
    } on FirebaseException catch (error) {
      emit(
        state.copyWith(exception: error.message),
      );
    }
  }

  Future<void> _updateUserRole(
    UpdateUserRole event,
    Emitter<AdminPanelState> emit,
  ) async {
    try {
      await _updateUserRoleUseCase.execute(
        UpdateUserRoleParams(
          uid: event.uid,
          role: event.role,
        ),
      );
      add(const LoadUsers());
    } on FirebaseException catch (error) {
      emit(
        state.copyWith(exception: error.message),
      );
    }
  }

  Future<void> _loadOrders(
    LoadOrders event,
    Emitter<AdminPanelState> emit,
  ) async {
    try {
      final List<OrdersHistoryUserInfoModel> orders =
      await _fetchAllOrdersUseCase.execute(
        const NoParams(),
      );
      final List<OrdersHistoryUserInfoModel> unReadyOrdersList = [];
      int salesAmount = 0;
      for (OrdersHistoryUserInfoModel order in orders) {
        salesAmount += order.ordersHistoryModel.cart.totalPrice;
        if (!order.ordersHistoryModel.isReady) {
          unReadyOrdersList.add(order);
        }
      }
      emit(
        state.copyWith(
          ordersList: orders,
          unReadyOrdersList: unReadyOrdersList,
          isLoading: false,
          salesAmount: salesAmount,
        ),
      );
    } on FirebaseException catch (error) {
      emit(
        state.copyWith(exception: error.message),
      );
    }
  }

  Future<void> _updateOrderStatus(
    UpdateOrderStatus event,
    Emitter<AdminPanelState> emit,
  ) async {
    try {
      await _updateOrderStatusUseCase.execute(
        UpdateOrderStatusParams(
          uid: event.uid,
          isReady: event.isReady,
        ),
      );
      add(const LoadOrders());
    } on FirebaseException catch (error) {
      emit(
        state.copyWith(exception: error.message),
      );
    }
  }

  Future<void> _deleteDish(
    DeleteDish event,
    Emitter<AdminPanelState> emit,
  ) async {
    try {
      await _deleteDishUseCase.execute(event.id);
      add(const LoadDishes());
    } on FirebaseException catch (error) {
      emit(
        state.copyWith(exception: error.message),
      );
    }
  }

  void _navigateToBackScreen(
      NavigateToBackScreen event,
      Emitter<AdminPanelState> emit,
      ) {
    _appRouter.pop();
  }
}

