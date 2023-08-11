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
    MainRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    DishRoute.name: (routeData) {
      final args = routeData.argsAs<DishRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: DishScreen(
          key: args.key,
          model: args.model,
        ),
      );
    },
    MenuRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MenuScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SearchScreen(),
      );
    },
    OrdersRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const OrdersScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
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
          MainRoute.name,
          path: 'main_screen',
          children: [
            RouteConfig(
              '#redirect',
              path: '',
              parent: MainRoute.name,
              redirectTo: 'menu_screen',
              fullMatch: true,
            ),
            RouteConfig(
              MenuRoute.name,
              path: 'menu_screen',
              parent: MainRoute.name,
            ),
            RouteConfig(
              SearchRoute.name,
              path: 'search_screen',
              parent: MainRoute.name,
            ),
            RouteConfig(
              OrdersRoute.name,
              path: 'orders_screen',
              parent: MainRoute.name,
            ),
            RouteConfig(
              ProfileRoute.name,
              path: 'profile_screen',
              parent: MainRoute.name,
            ),
          ],
        ),
        RouteConfig(
          DishRoute.name,
          path: 'dish',
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
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: 'main_screen',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [DishScreen]
class DishRoute extends PageRouteInfo<DishRouteArgs> {
  DishRoute({
    Key? key,
    required MenuItemEntity model,
  }) : super(
          DishRoute.name,
          path: 'dish',
          args: DishRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'DishRoute';
}

class DishRouteArgs {
  const DishRouteArgs({
    this.key,
    required this.model,
  });

  final Key? key;

  final MenuItemEntity model;

  @override
  String toString() {
    return 'DishRouteArgs{key: $key, model: $model}';
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
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute()
      : super(
          SearchRoute.name,
          path: 'search_screen',
        );

  static const String name = 'SearchRoute';
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
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile_screen',
        );

  static const String name = 'ProfileRoute';
}
