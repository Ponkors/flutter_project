import 'package:core/di/app_di.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

final ThemeDI themeDI = ThemeDI();

class ThemeDI {
  Future<void> initDependencies() async {
    _initHive();
    _initTheme();
  }

  void _initHive() {
    appLocator.registerLazySingleton<HiveProvider>(() => HiveProvider());
  }

  void _initTheme() {
    appLocator.registerLazySingleton<ThemeRepository>(
          () => ThemeRepositoryImpl(hiveProvider: appLocator<HiveProvider>()),
    );

    appLocator.registerLazySingleton<SetThemeUseCase>(
          () => SetThemeUseCase(themeRepository: appLocator.get<ThemeRepository>()),
    );

    appLocator.registerLazySingleton<GetThemeUseCase>(
          () => GetThemeUseCase(themeRepository: appLocator.get<ThemeRepository>()),
    );
  }
}
