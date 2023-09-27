import 'package:another_flushbar/flushbar.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:menu/menu.dart';
import 'package:authentication/authentication.dart';
import 'package:orders/bloc/cart_bloc.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DishesBloc bloc = BlocProvider.of<DishesBloc>(context);
    final CartBloc cartBloc = BlocProvider.of(context);
    final AuthenticationBloc authenticationBloc = BlocProvider.of(context);
    final ThemeData themeData = Theme.of(context);
    final MediaQueryData mediaQueryData= MediaQuery.of(context);
    cartBloc.add(InitCart());
    return RefreshIndicator(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (_, bool box) => <Widget>[
            SliverAppBar(
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    authenticationBloc.add(SignOutSubmitted());
                    authenticationBloc.add(NavigateToSignInScreen());
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: AppColors.grey,
                  ),
                ),
              ],
              backgroundColor: AppColors.orange,
              expandedHeight: AppDimens.size_1,
              title: Text(
                'menuPage.foodDelivery'.tr(),
                style: GoogleFonts.poppins(
                  textStyle: AppFonts.normal_16,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomTabs(),
            ),
          ],
          body: RefreshIndicator(
            onRefresh: () async {
              bloc.add(LoadListOfDishes());
            },
            child: BlocConsumer<DishesBloc, DishesState>(
              listener: (BuildContext context, DishesState state) {
                if (state.haveInternetConnection!) {
                  Flushbar(
                    flushbarPosition: FlushbarPosition.BOTTOM,
                    messageText: Text(
                      'menuScreen.haveInternetConnection'.tr(),
                      style: GoogleFonts.poppins(
                        textStyle: AppFonts.normal_16,
                      ),
                    ),
                    icon: const Icon(
                      Icons.done_all,
                      color: AppColors.green,
                    ),
                    duration: const Duration(seconds: 2),
                  ).show(context);
                } else {
                  Flushbar(
                    flushbarPosition: FlushbarPosition.BOTTOM,
                    messageText: Text(
                      'menuScreen.haventInternetConnection'.tr(),
                      style: GoogleFonts.poppins(
                        textStyle: AppFonts.normal_16,
                      ),
                    ),
                    icon: const Icon(
                      Icons.error_outline,
                      color: AppColors.red,
                    ),
                    duration: const Duration(seconds: 2),
                  ).show(context);
                }
              },
              listenWhen: (DishesState previous, DishesState current) {
                return current.haveInternetConnection !=
                    previous.haveInternetConnection;
              },
              builder: (_, DishesState state) {
                if (state.exception != null) {
                  return Center(
                    child: Text(
                      state.exception?.toString() ?? 'Got a trouble...',
                    ),
                  );
                }
                if (state.listOfDishes.isNotEmpty) {
                  return Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(AppDimens.padding_20),
                          itemCount: state.dishesOfEnteredCategory.isEmpty
                              ? state.listOfDishes.length
                              : state.dishesOfEnteredCategory.length,
                          itemBuilder: (_, int index) {
                            final dish = state.listOfDishes[index];
                            return DishItem(
                              dish: state.dishesOfEnteredCategory.isEmpty
                                  ? state.listOfDishes[index]
                                  : state.dishesOfEnteredCategory[index],
                              onTap: () {
                                context.navigateTo(
                                  SelectDishRoute(
                                    dish: state.dishesOfEnteredCategory.isEmpty
                                        ? state.listOfDishes[index]
                                        : state.dishesOfEnteredCategory[index],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return const LoadingIndicator();
                }
              },
            ),
          )
        ),
      ),
      onRefresh: () async {
        bloc.add(LoadListOfDishes());
      },
    );
  }
}

