import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:menu/bloc/menu_bloc.dart';
import 'package:navigation/navigation.dart';

class PreMenuScreen extends StatelessWidget {
  const PreMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DishesBloc>(
      create: (_) => DishesBloc(
        fetchAllDishesUseCase: getIt.get<FetchAllDishesUseCase>(),
      ),
      child: AutoTabsScaffold(
        routes: const <PageRouteInfo<dynamic>>[
          MenuRoute(),
          OrdersRoute(),
          HistoryRoute(),
          SettingsRoute(),
        ],
        appBarBuilder: (_, TabsRouter tabsRouter) {
          return AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'menuPage.foodDelivery'.tr(),
            ),
          );
        },
        bottomNavigationBuilder: (_, TabsRouter tabsRouter) {
          return CustomBottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
          );
        },
      ),
    );
  }
}
