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
      "menu": "Menu",
      "cart": "Cart",
      "orderHistory": "Order History",
      "settings": "Settings",
      "adminPanel": "Admin Panel",
    },
    "adminPage": {
      "orders": "Orders",
      "users": 'Users',
      "changeRole": "Change Role",
      "cancel": "Cancel",
      "save": "Save",

    },
    "menuScreen": {
      "add": "Add",
      "dishAddedToTheCart": "The dish has been added to the cart!",
      "haveInternetConnection": "Internet Connection is working.",
      "haventInternetConnection": "Internet Connection isn't working.",
      "categories": "Categories",
      "dishes": "Dishes",
    },
    "selectDishScreen": {
      "add": "Add to cart",
      "ingredients": "Ingredients",
      "cost": "Price:",
      "description": "Description:"
    },
    "cartScreen": {
      "yourShoppingCartIsEmpty": "Your shopping cart is still empty.",
      "additionTitle": "Try to select some dishes :)",
      "chooseDishes": "Go to menu",
      "totalPrice": "Total Price",
      "makeAnOrder": "Make An Order",
      "check": "Preliminary check",
      "acceptedOrder": "Accepted order, wait call soon.",
      "dishPositionCount": "Positions",
      "cost:": "Price:",
      "haventInternetConnection": "Internet Connection isn't working."
    },
    "settingsScreen": {
      "useSystemTheme": "System color theme:",
      "useAppTheme": "Application theme:",
      "lightTheme": "Light day   --",
      "darkTheme": "Dark night --",
      "changeFontSize": "Move the slider to change the font size",
      "selectLanguage": "Language",
      "contactButton": "Contact with employer"
    },
    "authenticationScreen": {
      "email": "Email",
      "password": "Password",
      "userName": "User name",
      "emailRequired": "Email is required",
      "userNameIsRequired": "User name is required",
      "emailFormatWrong": "Invalid email format",
      "invalidUserName": "The user name must be at least 5 characters long",
      "invalidPassword": "The password must be at least 8 characters long",
      "forgotPassword": "Forgot password?",
      "signIn": "Sign In",
      "signUp": "Sign Up",
      "or": "Or",
      "signInWithGoogle": "Sign In with Google",
      "haventAccount": "Don't have an account?",
      "haveAccount": "Already have an account?",
      "resetPassword": "Reset password",
      "checkEmail": "New password has been pass. Check your email."
    },
    "orderHistoryScreen": {
      "orderHistoryEmpty": "Your order history is empty",
      "price": "Check amount:",
      "id": "Check ID:",
    }
  };
  static const Map<String,dynamic> pl_PL = {
    "menuPage": {
      "foodDelivery": "Usługa gastronomiczna Tamang",
      "menu": "Spis treści",
      "cart": "Koszyk",
      "orderHistory": "Historia",
      "settings": "Ustawienia"
    },
    "menuScreen": {
      "add": "Dodaj",
      "dishAddedToTheCart": "Danie zostało dodane do koszyka!",
      "haveInternetConnection": "Połączenie internetowe działa.",
      "haventInternetConnection": "Połączenie internetowe nie działa.",
      "categories": "Kategorie",
      "dishes": "Strawa"
    },
    "selectDishScreen": {
      "add": "Dodaj do koszyka",
      "ingredients": "Składniki",
      "cost": "Koszt:",
      "description": "Opis:",
    },
    "cartScreen": {
      "yourShoppingCartIsEmpty": "Twój koszyk jest pusty.",
      "additionTitle": "Spróbuj wybrać kilka potraw :)",
      "chooseDishes": "Przejdź do menu",
      "totalPrice": "Cena Całkowita",
      "makeAnOrder": "Złóż zamówienie",
      "check": "Wstępna kontrola",
      "acceptedOrder": "Zamówienie przyjęte. Czekaj zadzwoń.",
      "dishPositionCount": "Pozycje",
      "cost": "Koszt:",
      "haventInternetConnection": "Połączenie internetowe nie działa."
    },
    "settingsScreen": {
      "useSystemTheme": "Kolor systemowy",
      "useAppTheme": "Motyw aplikacji:",
      "lightTheme": "Lekki dzień   --",
      "darkTheme": "Ciemna noc --",
      "changeFontSize": "Przesuń suwak, aby zmienić rozmiar czcionki",
      "selectLanguage": "Język",
      "contactButton": "Kontakt z pracodawcą"
    },
    "authenticationScreen": {
      "email": "Email",
      "password": "Hasło",
      "userName": "Jak masz na imię?",
      "emailRequired": "E-mail jest wymagany",
      "userNameIsRequired": "Nazwa użytkownika jest wymagana",
      "emailFormatWrong": "Nieprawidłowy format wiadomości e-mail",
      "invalidUserName": "Nazwa użytkownika musi mieć co najmniej 3 znaki",
      "invalidPassword": "Hasło musi mieć co najmniej 8 znaków",
      "forgotPassword": "Zapomniałem hasła?",
      "signIn": "Zaloguj się",
      "signUp": "Zarejestruj się",
      "or": "Or",
      "signInWithGoogle": "Zaloguj się przez Google",
      "haventAccount": "Nie masz konta?",
      "haveAccount": "Masz już konto?",
      "resetPassword": "Resetuj hasło",
      "checkEmail": "Nowe hasło zostało przekazane. Sprawdź swoją pocztę."
    },
    "orderHistoryScreen": {
      "orderHistoryEmpty": "Twoja historia zamówień jest pusta",
      "price": "Sprawdź kwotę:",
      "id": "Sprawdź dowód:",
    }
  };
  static const Map<String, Map<String,dynamic>> mapLocales = {"en_US": en_US, "pl_PL": pl_PL};
}