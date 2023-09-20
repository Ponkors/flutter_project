import 'package:another_flushbar/flushbar.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:menu/menu.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DishesBloc bloc = BlocProvider.of<DishesBloc>(context);
    return RefreshIndicator(
      child: SafeArea(
        child: Scaffold(
          body: BlocConsumer<DishesBloc, DishesState>(
            listener: (BuildContext context, DishesState state) {
              if (state.haveInternetConnection) {
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
                  // padding: const EdgeInsets.all(
                  //   AppDimens.padding_15,
                  // ),
                ).show(context);
              } else {
                Flushbar(
                  flushbarPosition: FlushbarPosition.BOTTOM,
                  messageText: Text(
                    'menuScreen.noInternetConnection'.tr(),
                    style: GoogleFonts.poppins(
                      textStyle: AppFonts.normal_16,
                    ),
                  ),
                  icon: const Icon(
                    Icons.error_outline,
                    color: AppColors.red,
                  ),
                  duration: const Duration(seconds: 2),
                  // padding: const EdgeInsets.all(
                  //   AppDimens.padding_15,
                  // ),
                ).show(context);
              }
            },
            builder: (_, DishesState state) {
              if (state.exception != null) {
                return Center(
                  child:
                  Text(state.exception?.toString() ?? 'Got a trouble :('),
                );
              }
              if (state.listOfDishes.isNotEmpty) {
                return ListView.builder(
                  padding: const EdgeInsets.all(AppDimens.padding_20),
                  itemCount: state.listOfDishes.length,
                  itemBuilder: (context, index) {
                    final dish = state.listOfDishes[index];
                    return DishItem(
                      dish: dish,
                      onTap: () {
                        context.navigateTo(SelectDishRoute(
                          dish: state.listOfDishes[index],
                        ));
                      },
                    );
                  },
                );
              } else {
                return const LoadingIndicator();
              }
            },
          ),
        ),
      ),
      onRefresh: () async {
        bloc.add(LoadListOfDishes());
      },
    );
  }
}
