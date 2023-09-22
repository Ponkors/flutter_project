import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';
import 'package:orders/orders.dart';
import 'package:settings/settings.dart';
import 'package:authentication/authentication.dart';

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<SettingsBloc>(
          create: (_) => SettingsBloc(
            checkThemeTypeUseCase: getIt.get<CheckThemeTypeUseCase>(),
            checkThemeModeUseCase: getIt.get<CheckThemeModeUseCase>(),
            checkFontSizeUseCase: getIt.get<CheckFontSizeUseCase>(),
            setThemeTypeUseCase: getIt.get<SetThemeTypeUseCase>(),
            setThemeModeUseCase: getIt.get<SetThemeModeUseCase>(),
            setFontSizeUseCase: getIt.get<SetFontSizeUseCase>(),
          ),
        ),
        BlocProvider<CartBloc>(
          create: (_) => CartBloc(
            getCartDishesUseCase: getIt.get<GetCartDishesUseCase>(),
            addCartDishUseCase: getIt.get<AddCartDishUseCase>(),
            removeCartDishUseCase: getIt.get<RemoveCartDishUseCase>(),
            clearCartUseCase: getIt.get<ClearCartUseCase>(),
            getUserFromStorageUseCase: getIt.get<GetUserFromStorageUseCase>(),
          ),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (_) => AuthenticationBloc(
            signInUseCase: getIt.get<SignInUseCase>(),
            signUpUseCase: getIt.get<SignUpUseCase>(),
            signOutUseCase: getIt.get<SignOutUseCase>(),
            signInWithGoogleUseCase: getIt.get<SignInWithGoogleUseCase>(),
            resetPasswordUseCase: getIt.get<ResetPasswordUseCase>(),
            getUserFromStorageUseCase: getIt.get<GetUserFromStorageUseCase>(),
            appRouter: getIt.get<AppRouter>(),
          )..add(InitAuthentication()),
        ),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (BuildContext context, SettingsState state) {
          return MaterialApp.router(
            builder: (BuildContext context, Widget? child) {
              final MediaQueryData mediaQueryData = MediaQuery.of(context);
              return MediaQuery(
                data: mediaQueryData.copyWith(
                  textScaleFactor: state.textScale,
                ),
                child: child!,
              );
            },
            routerDelegate: getIt.get<AppRouter>().delegate(),
            routeInformationParser: getIt.get<AppRouter>().defaultRouteParser(),
            title: 'Toomang FoodService',
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: state.systemTheme ? ThemeData.light() : state.themeData,
            darkTheme: state.systemTheme ? ThemeData.dark() : state.themeData,
          );
        },
      ),
    );
  }
}
