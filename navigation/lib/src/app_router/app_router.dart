import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:features/features.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: WelcomeScreen,
      path: 'welcome_screen',
      initial: true,
    ),
    AutoRoute(
      page: WalkthroughScreenView,
      path: 'walkthrough_screen',
    ),
    AutoRoute(page: SingleRestaurantScreen, path: 'single_restaurant_screen')
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
