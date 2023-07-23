import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:features/features.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomeScreen,
      path: '/',
      initial: true,
    ),
    AutoRoute(
      page: WelcomeFormScreenView,
      path: 'welcome_screen',
    ),
    AutoRoute(page: MenuScreen, path: 'menu_screen')
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
