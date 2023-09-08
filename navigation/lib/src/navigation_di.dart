import 'package:core/di/app_di.dart';
import 'package:navigation/src/app_router/app_router.dart';

void initNavigationDependencies() {
  appLocator.registerSingleton<AppRouter>(AppRouter());
}
