import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:home/home.dart';
import 'package:orders/orders.dart';
import 'package:history/history.dart';
import 'package:menu/menu.dart';
import 'package:settings/screen/settings_screen.dart';
import 'package:welcome/welcome.dart';
import 'package:domain/domain.dart';
import 'package:settings/settings.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeScreen, path: '/', initial: true),
    AutoRoute(page: WelcomeScreens, path: 'welcome_screens'),
    AutoRoute(page: PreMenuScreen, path: 'home_page', initial: true, children: [
      AutoRoute(page: MenuScreen, path: 'menu_screen', initial: true),
      AutoRoute(page: OrdersScreen, path: 'orders_screen'),
      AutoRoute(page: HistoryScreen, path: 'history_screen'),
      AutoRoute(page: SettingsScreen, path: 'settings_screen'),
    ]),
    AutoRoute(
        page: SelectDishScreen, path: 'select_dish_screen', initial: true),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
