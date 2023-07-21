import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:home/home.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
        page: WelcomeScreen,
        // path: 'welcome_screen.dart',
        name: 'WelcomeScreen',
        initial: true),
    AutoRoute(
      page: WalkthroughScreenView,
      // path: 'walkthrough_screen.dart',
      name: 'WalkthroughScreen',
    ),
    AutoRoute(
      page: SingleRestaurantScreen,
      // path: 'single_restaurant_screen',
      name: 'SingleRestaurantScreen',
    ),
  ],
)
class AppRouter extends _$AppRouter {}
