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
    CheckAuthenticationRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const CheckAuthenticationScreen(),
      );
    },
    SignInRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SignInScreen(),
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
    OrdersHistoryRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const OrdersHistoryScreen(),
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
          '/#redirect',
          path: '/',
          redirectTo: 'start_screen',
          fullMatch: true,
        ),
        RouteConfig(
          CheckAuthenticationRoute.name,
          path: 'start_screen',
        ),
        RouteConfig(
          SignInRoute.name,
          path: 'signIn_screen',
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
              OrdersHistoryRoute.name,
              path: 'orders_history_screen',
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
/// [CheckAuthenticationScreen]
class CheckAuthenticationRoute extends PageRouteInfo<void> {
  const CheckAuthenticationRoute()
      : super(
          CheckAuthenticationRoute.name,
          path: 'start_screen',
        );

  static const String name = 'CheckAuthenticationRoute';
}

/// generated route for
/// [SignInScreen]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: 'signIn_screen',
        );

  static const String name = 'SignInRoute';
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
/// [OrdersHistoryScreen]
class OrdersHistoryRoute extends PageRouteInfo<void> {
  const OrdersHistoryRoute()
      : super(
          OrdersHistoryRoute.name,
          path: 'orders_history_screen',
        );

  static const String name = 'OrdersHistoryRoute';
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
