import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartDishesUseCase _getCartDishesUseCase;
  final GetUserFromStorageUseCase _getUserFromStorageUseCase;
  final AddCartDishUseCase _addCartDishUseCase;
  final RemoveCartDishUseCase _removeCartDishUseCase;
  final ClearCartUseCase _clearCartUseCase;
  final AppRouter _appRouter;
  CartBloc({
    required GetCartDishesUseCase getCartDishesUseCase,
    required GetUserFromStorageUseCase getUserFromStorageUseCase,
    required AddCartDishUseCase addCartDishUseCase,
    required RemoveCartDishUseCase removeCartDishUseCase,
    required ClearCartUseCase clearCartUseCase,
    required AppRouter appRouter,
  }) : _getCartDishesUseCase = getCartDishesUseCase,
       _getUserFromStorageUseCase = getUserFromStorageUseCase,
       _addCartDishUseCase = addCartDishUseCase,
       _removeCartDishUseCase = removeCartDishUseCase,
       _clearCartUseCase = clearCartUseCase,
       _appRouter = appRouter,
       super(CartState.empty()) {
    on<InitCart>(_initCart);
    on<AddDishToCart>(_addDishToCart);
    on<RemoveDishFromCart>(_removeDishFromCart);
    on<ClearCart>(_clearCart);
    on<NavigateToBackScreen>(_navigateToBackScreen);
    add(InitCart());
  }

  Future<void> _initCart(
    InitCart event,
    Emitter<CartState> emit,
  ) async {
    emit(CartState.empty());
    final UserModel userFromStorage = await _getUserFromStorageUseCase.execute(
      const NoParams(),
    );
    final List<CartDish> dishesInCart = await _getCartDishesUseCase.execute(
      userFromStorage.identifierId,
    );
    emit(
      state.copyWith(
        userUid: userFromStorage.identifierId,
      ),
    );
    if (dishesInCart.isEmpty) {
      emit(state.copyWith(cart: state.cart));
    } else {
      int totalPrice = 0;
      for (final item in dishesInCart) {
        totalPrice += item.dish.cost * item.quantity;
      }
      emit(
        state.copyWith(
          cart: state.cart.copyWith(
            dishes: dishesInCart,
            totalPrice: totalPrice,
          ),
        ),
      );
    }
  }

  Future<void> _addDishToCart(
    AddDishToCart event,
    Emitter<CartState> emit,
  ) async {
    await _addCartDishUseCase.execute(AddToCartParameters(
      dish: event.dish,
      userId: state.userUid,
    ));
    final List<CartDish> updatedCartItems = await _getCartDishesUseCase.execute(
      state.userUid,
    );
    emit(
      state.copyWith(
        cart: CartModel(
          dishes: updatedCartItems,
          totalPrice: state.cart.totalPrice + event.dish.cost,
        ),
      ),
    );
  }

  Future<void> _removeDishFromCart(
    RemoveDishFromCart event,
    Emitter<CartState> emit,
  ) async {
    await _removeCartDishUseCase.execute(RemoveCartParameters(
      cart: event.cartDish,
      userId: state.userUid,
    ));
    final List<CartDish> updatedCartItems = await _getCartDishesUseCase.execute(
      state.userUid,
    );
    emit(
      state.copyWith(
        cart: CartModel(
          dishes: updatedCartItems,
          totalPrice: state.cart.totalPrice - event.cartDish.dish.cost,
        ),
      ),
    );
  }

  Future<void> _clearCart(
    ClearCart event,
    Emitter<CartState> emit,
  ) async {
    await _clearCartUseCase.execute(
      state.userUid,
    );
    emit(
      state.copyWith(
        cart: const CartModel(
          dishes: [],
          totalPrice: 0,
        ),
      ),
    );
  }

  void _navigateToBackScreen(
    NavigateToBackScreen event,
    Emitter<CartState> emit,
  ) {
    _appRouter.pop();
  }

}