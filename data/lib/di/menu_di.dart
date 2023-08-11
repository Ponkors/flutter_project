import 'package:core/di/app_di.dart';
import 'package:data/data.dart';
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
  }
}
