import 'package:core/core.dart';
import 'package:flutter/material.dart';

extension CustomBottomNavigationBarItemEx on CustomBottomNavigationBarItem {
  String get label {
    switch (this) {
      case CustomBottomNavigationBarItem.menu:
        return 'menuPage.menu'.tr();
      case CustomBottomNavigationBarItem.cart:
        return 'menuPage.cart'.tr();
      case CustomBottomNavigationBarItem.orderHistory:
        return 'menuPage.orderHistory'.tr();
      case CustomBottomNavigationBarItem.settings:
        return 'menuPage.settings'.tr();
      default:
        return '';
    }
  }

  Icon get icon {
    switch (this) {
      case CustomBottomNavigationBarItem.menu:
        return const Icon(Icons.menu_book);
      case CustomBottomNavigationBarItem.cart:
        return const Icon(Icons.shopping_cart);
      case CustomBottomNavigationBarItem.orderHistory:
        return const Icon(Icons.history);
      case CustomBottomNavigationBarItem.settings:
        return const Icon(Icons.settings);
      default:
        return const Icon(Icons.home);
    }
  }
}