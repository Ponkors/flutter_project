import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:home/home.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: WelcomeScreen, initial: true),
    AutoRoute(page: WalkthroughScreenView),
    AutoRoute(page: SingleRestaurantScreen),
  ],
)
class AppRouter extends _$AppRouter {}
