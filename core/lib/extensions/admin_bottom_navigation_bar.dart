import 'package:core/core.dart';
import 'package:flutter/material.dart';

extension AdminBottomNavigationBarItemEx on AdminBottomNavigationBarItem {
  String get label {
    switch (this) {
      case AdminBottomNavigationBarItem.dashboard:
        return 'menuPage.home'.tr();
      case AdminBottomNavigationBarItem.users:
        return 'menuPage.cart'.tr();
      case AdminBottomNavigationBarItem.orders:
        return 'menuPage.orderHistory'.tr();
      case AdminBottomNavigationBarItem.products:
        return 'menuPage.orderHistory'.tr();
      default:
        return '';
    }
  }

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