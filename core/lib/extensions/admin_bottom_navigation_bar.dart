import 'package:core/core.dart';
import 'package:flutter/material.dart';

extension AdminBottomNavigationBarItemEx on CustomBottomNavigationBarItem {
  Icon get icon {
    switch (this) {
      case AdminBottomNavigationBarItem.dashboard:
        return const Icon(Icons.dashboard);
      case AdminBottomNavigationBarItem.users:
        return const Icon(Icons.shopping_cart);
      case AdminBottomNavigationBarItem.orders:
        return const Icon(Icons.shopping_cart);
      case AdminBottomNavigationBarItem.products:
        return const Icon(Icons.restaurant);
      default:
        return const Icon(Icons.dashboard);
    }
  }
}