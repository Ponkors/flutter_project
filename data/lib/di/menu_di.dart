import 'package:core/di/app_di.dart';
import 'package:data/data.dart';
import 'package:data/repositories/header_menu_repository_impl.dart';
import 'package:data/repositories/horizontal_menu_repository_impl.dart';
import 'package:domain/domain.dart';

final MenuDI menuDI = MenuDI();

class MenuDI {
  Future<void> initDependencies() async {
    _initFirebase();
    _initDishes();
  }

  void _initFirebase() {
    appLocator.registerLazySingleton<FirebaseProvider>(
      () => FirebaseProvider(),
    );
  }

  void _initDishes() {
    appLocator.registerLazySingleton<MenuItemRepository>(
        () => MenuItemRepository(appLocator.get<FirebaseProvider>()));

    appLocator.registerLazySingleton<GetMenuListUseCase>(
      () => GetMenuListUseCase(appLocator.get<MenuItemRepository>()),
    );

    appLocator.registerLazySingleton<HorizontalMenuItemRepository>(
        () => HorizontalMenuItemRepository(appLocator.get<FirebaseProvider>()));

    appLocator.registerLazySingleton<GetHorizontalMenuListUseCase>(
        () => GetHorizontalMenuListUseCase(appLocator.get<HorizontalMenuItemRepository>()),
    );

    appLocator.registerLazySingleton<HeaderMenuItemRepository>(
            () => HeaderMenuItemRepository(appLocator.get<FirebaseProvider>()));

    appLocator.registerLazySingleton<GetHeaderMenuListUseCase>(
            () => GetHeaderMenuListUseCase(appLocator.get<HeaderMenuItemRepository>()),
    );
  }
}
