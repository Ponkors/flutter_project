import 'package:features/orders/orders_screen.dart';
import 'package:features/search/search_screen.dart';
import 'package:features/welcome_pages/welcome_screens.dart';
import 'package:profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:features/features.dart';
import 'package:profile/profile.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeScreen, path: '/', initial: true),
    AutoRoute(page: WelcomeScreens, path: 'welcome_screens'),
    AutoRoute(page: MainScreen, path: 'main_screen', initial: true, children: [
      AutoRoute(page: MenuScreen, path: 'menu_screen', initial: true),
      AutoRoute(page: SearchScreen, path: 'search_screen'),
      AutoRoute(page: OrdersScreen, path: 'orders_screen'),
      AutoRoute(page: ProfileScreen, path: 'profile_screen'),
    ]),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
