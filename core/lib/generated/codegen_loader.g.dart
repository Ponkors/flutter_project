// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en_US = {
    "menuPage": {
      "foodDelivery": "Tamang FoodService",
      "home": "Home",
      "cart": "Cart",
      "orderHistory": "Order History",
      "settings": "Settings"
    },
    "menuScreen": {
      "add": "Add",
      "dishAddedToTheCart": "The dish has been added to the cart!",
      "haveInternetConnection": "Internet Connection is working.",
      "noInternetConnection": "Internet Connection isn't working.",
    },
    "selectDishScreen": {
      "add": "Add to cart",
      "ingredients": "Ingredients",
      "cost": "Cost"
    },
    "cartScreen": {
      "yourShoppingCartIsEmpty": "Your shopping cart is still empty.",
      "additionTitle": "Try to select some dishes :)",
      "chooseDishes": "Go to menu",
      "totalPrice": "Total Price",
      "makeAnOrder": "Make An Order",
      "dishPositionCount": "Positions",
      "check": "Preliminary check"
    },
    "settingsScreen": {
      "useSystemTheme": "System theme:",
      "useAppTheme": "Application theme:",
      "lightTheme": "Light day   --",
      "darkTheme": "Dark night --",
      "changeFontSize": "Move the slider to change the font size",
      "selectLanguage": "Language",
      "contactUs": "Contact us"
    }
  };
  static const Map<String,dynamic> pl_PL = {
    "menuPage": {
      "foodDelivery": "Usługa gastronomiczna Tamang",
      "home": "Spis treści",
      "cart": "Koszyk",
      "orderHistory": "Historia",
      "settings": "Ustawienia"
    },
    "menuScreen": {
      "add": "Dodaj",
      "dishAddedToTheCart": "Danie zostało dodane do koszyka!",
    "haveInternetConnection": "Połączenie internetowe działa.",
    "notInternetConnection": "Połączenie internetowe nie działa.",
    },
    "selectDishScreen": {
      "add": "Dodaj do koszyka",
      "ingredients": "Składniki",
      "cost": "Koszt"
    },
    "cartScreen": {
      "yourShoppingCartIsEmpty": "Twój koszyk jest pusty.",
      "additionTitle": "Spróbuj wybrać kilka potraw :)",
      "chooseDishes": "Przejdź do menu",
      "totalPrice": "Cena Całkowita",
      "makeAnOrder": "Złóż zamówienie",
      "dishPositionCount": "Pozycje",
      "check": "Wstępna kontrola"
    },
    "settingsScreen": {
      "useSystemTheme": "Temat systemu:",
      "useAppTheme": "Motyw aplikacji:",
      "lightTheme": "Lekki dzień   --",
      "darkTheme": "Ciemna noc --",
      "changeFontSize": "Przesuń suwak, aby zmienić rozmiar czcionki",
      "selectLanguage": "Język",
      "contactUs": "Skontaktuj się z nami"
    }
  };
  static const Map<String, Map<String,dynamic>> mapLocales = {"en_US": en_US, "pl_PL": pl_PL};
}