import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:history/bloc/history_bloc.dart';
import 'package:menu/bloc/menu_bloc.dart';
import 'package:navigation/navigation.dart';

class PreMenuScreen extends StatelessWidget {
  const PreMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<DishesBloc>(
          create: (_) => DishesBloc(
            fetchAllDishesUseCase:  getIt.get<FetchAllDishesUseCase>(),
          ),
        ),
        BlocProvider<OrdersHistoryBloc>(
          create: (_) => OrdersHistoryBloc(
            addOrdersHistoryUseCase: getIt.get<AddOrdersHistoryUseCase>(),
            fetchOrdersHistoryUseCase: getIt.get<FetchOrdersHistoryUseCase>(),
            getUserFromStorageUseCase: getIt.get<GetUserFromStorageUseCase>(),
          )..add(InitializeListOfOrdersHistory()),
        ),
      ],
      child: AutoTabsScaffold(
        routes: const <PageRouteInfo<dynamic>>[
          MenuRoute(),
          OrdersRoute(),
          OrdersHistoryRoute(),
          SettingsRoute(),
        ],
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
