import 'dart:async';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:history/history.dart';
import 'package:navigation/navigation.dart';
import 'package:orders/orders.dart';
import 'package:menu/menu.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    Timer(const Duration(milliseconds: 300), () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CartBloc cartBloc = BlocProvider.of(context);
    final OrdersHistoryBloc ordersHistoryBloc = BlocProvider.of(context);
    final DishesBloc dishesBloc = BlocProvider.of<DishesBloc>(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'menuPage.cart'.tr(),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (_, CartState state) {
          if (state.cart.dishes.isNotEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(AppDimens.padding_10),
                    itemCount: state.cart.dishes.length,
                    itemBuilder: (_, int index) {
                      return FadeTransition(
                        opacity: _animation,
                        child: CartItem(
                          cartItem: state.cart.dishes.elementAt(index),
                        ),
                      );
                    },
                  ),
                ),
                TotalPrice(
                  totalPrice: state.cart.totalPrice,
                  onPressed: () {
                    if (dishesBloc.state.haveInternetConnection!) {
                      ordersHistoryBloc.add(
                        AddOrder(
                          order: OrdersHistoryModel(
                            id: state.userUid,
                            cart: state.cart,
                            dateTime: DateTime.now(),
                            isReady: false,
                          ),
                        ),
                      );
                      _showSnackBar(
                        context,
                        'cartScreen.acceptedOrder'.tr(),
                        AppColors.green,
                      );
                      cartBloc.add(ClearCart());
                    } else {
                      _showSnackBar(
                        context,
                        'cartScreen.haventInternetConnection'.tr(),
                        AppColors.red,
                      );
                    }
                  },
                  itemCount: state.cart.dishes.length,
                ),
              ],
            );
          } else {
            return CartEmpty(
              onPressed: () {
                context.navigateTo(const MenuRoute());
              },
            );
          }
        },
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message, Color color) {
    final ThemeData themeData = Theme.of(context);
    final SnackBar snackBar = SnackBar(
      content: Text(
        message,
        style: themeData.textTheme.titleMedium!.copyWith(
          color: AppColors.white,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
