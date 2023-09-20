// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    WelcomeRoutes.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const WelcomeScreens(),
      );
    },
    PreMenuRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const PreMenuScreen(),
      );
    },
    SelectDishRoute.name: (routeData) {
      final args = routeData.argsAs<SelectDishRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: SelectDishScreen(
          dish: args.dish,
          key: args.key,
        ),
      );
    },
    MenuRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MenuScreen(),
      );
    },
    OrdersRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const OrdersScreen(),
      );
    },
    HistoryRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HistoryScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        RouteConfig(
          WelcomeRoutes.name,
          path: 'welcome_screens',
        ),
        RouteConfig(
          PreMenuRoute.name,
          path: 'home_page',
          children: [
            RouteConfig(
              '#redirect',
              path: '',
              parent: PreMenuRoute.name,
              redirectTo: 'menu_screen',
              fullMatch: true,
            ),
            RouteConfig(
              MenuRoute.name,
              path: 'menu_screen',
              parent: PreMenuRoute.name,
            ),
            RouteConfig(
              OrdersRoute.name,
              path: 'orders_screen',
              parent: PreMenuRoute.name,
            ),
            RouteConfig(
              HistoryRoute.name,
              path: 'history_screen',
              parent: PreMenuRoute.name,
            ),
            RouteConfig(
              SettingsRoute.name,
              path: 'settings_screen',
              parent: PreMenuRoute.name,
            ),
          ],
        ),
        RouteConfig(
          SelectDishRoute.name,
          path: 'select_dish_screen',
        ),
      ];
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [WelcomeScreens]
class WelcomeRoutes extends PageRouteInfo<void> {
  const WelcomeRoutes()
      : super(
          WelcomeRoutes.name,
          path: 'welcome_screens',
        );

  static const String name = 'WelcomeRoutes';
}

/// generated route for
/// [PreMenuScreen]
class PreMenuRoute extends PageRouteInfo<void> {
  const PreMenuRoute({List<PageRouteInfo>? children})
      : super(
          PreMenuRoute.name,
          path: 'home_page',
          initialChildren: children,
        );

  static const String name = 'PreMenuRoute';
}

/// generated route for
/// [SelectDishScreen]
class SelectDishRoute extends PageRouteInfo<SelectDishRouteArgs> {
  SelectDishRoute({
    required DishModel dish,
    Key? key,
  }) : super(
          SelectDishRoute.name,
          path: 'select_dish_screen',
          args: SelectDishRouteArgs(
            dish: dish,
            key: key,
          ),
        );

  static const String name = 'SelectDishRoute';
}

class SelectDishRouteArgs {
  const SelectDishRouteArgs({
    required this.dish,
    this.key,
  });

  final DishModel dish;

  final Key? key;

  @override
  String toString() {
    return 'SelectDishRouteArgs{dish: $dish, key: $key}';
  }
}

/// generated route for
/// [MenuScreen]
class MenuRoute extends PageRouteInfo<void> {
  const MenuRoute()
      : super(
          MenuRoute.name,
          path: 'menu_screen',
        );

  static const String name = 'MenuRoute';
}

/// generated route for
/// [OrdersScreen]
class OrdersRoute extends PageRouteInfo<void> {
  const OrdersRoute()
      : super(
          OrdersRoute.name,
          path: 'orders_screen',
        );

  static const String name = 'OrdersRoute';
}

/// generated route for
/// [HistoryScreen]
class HistoryRoute extends PageRouteInfo<void> {
  const HistoryRoute()
      : super(
          HistoryRoute.name,
          path: 'history_screen',
        );

  static const String name = 'HistoryRoute';
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: 'settings_screen',
        );

  static const String name = 'SettingsRoute';
}
