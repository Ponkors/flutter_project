import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    _initFirebase();
    _initDataProvider();
    _initHiveProdiver();
    _initAuthenticationDataProvider();
    _initDishes();
    _initHive();
    _initHiveAdapter();
    _initSettings();
    _initCart();
    _initAuthentication();
    _initOrdersHistory();
    _initAdminPanel();
  }

  Future<void> _initFirebase() async {
    getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance,
    );
    getIt.registerLazySingleton<FirebaseAuth>(
      () => FirebaseAuth.instance,
    );
    FirebaseFirestore.instance.clearPersistence();
  }

  void _initHiveAdapter() {
    getIt.registerLazySingleton<DishEntityAdapter>(
      () => DishEntityAdapter(),
    );
    getIt.registerLazySingleton<CartEntityAdapter>(
      () => CartEntityAdapter(),
    );
    getIt.registerLazySingleton<CartDishEntityAdapter>(
      () => CartDishEntityAdapter(),
    );
    getIt.registerLazySingleton<UserEntityAdapter>(
      () => UserEntityAdapter(),
    );
    getIt.registerLazySingleton<OrdersHistoryEntityAdapter>(
      () => OrdersHistoryEntityAdapter(),
    );
  }

  Future<void> _initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(
      getIt.get<DishEntityAdapter>(),
    );
    Hive.registerAdapter(
      getIt.get<CartEntityAdapter>(),
    );
    Hive.registerAdapter(
      getIt.get<CartDishEntityAdapter>(),
    );
    Hive.registerAdapter(
      getIt.get<UserEntityAdapter>(),
    );
    Hive.registerAdapter(
      getIt.get<OrdersHistoryEntityAdapter>(),
    );
  }

  void _initDataProvider() {
    getIt.registerLazySingleton<FirebaseFirestoreDataProvider>(
      () => FirebaseFirestoreDataProviderImpl(
        firebaseFirestore: getIt.get<FirebaseFirestore>(),
      ),
    );
  }

  void _initHiveProdiver() {
    getIt.registerLazySingleton<HiveProvider>(
      () => HiveProviderImpl(),
    );
  }

  void _initAuthenticationDataProvider() {
    getIt.registerLazySingleton<FirebaseAuthProvider>(
      () => FirebaseAuthProviderImpl(
        firebaseAuth: getIt.get<FirebaseAuth>(),
        firebaseFirestoreDataProvider: getIt.get<FirebaseFirestoreDataProvider>(),
        hiveProvider: getIt.get<HiveProvider>(),
      ),
    );
  }

  void _initDishes() {
    getIt.registerLazySingleton<DishesRepository>(
      () => DishesRepositoryImpl(
        firebaseFirestoreDataProvider: getIt.get<FirebaseFirestoreDataProvider>(),
        hiveProvider: getIt.get<HiveProvider>(),
      ),
    );
    getIt.registerLazySingleton<FetchAllDishesUseCase>(
      () => FetchAllDishesUseCase(
        dishesRepository: getIt.get<DishesRepository>(),
      ),
    );
  }

  void _initCart() {
    getIt.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(
        hiveProvider: getIt.get<HiveProvider>(),
      ),
    );
    getIt.registerLazySingleton<GetCartDishesUseCase>(
          () => GetCartDishesUseCase(
        cartRepository: getIt.get<CartRepository>(),
      ),
    );
    getIt.registerLazySingleton<AddCartDishUseCase>(
      () => AddCartDishUseCase(
        cartRepository: getIt.get<CartRepository>(),
      ),
    );
    getIt.registerLazySingleton<RemoveCartDishUseCase>(
      () => RemoveCartDishUseCase(
        cartRepository: getIt.get<CartRepository>(),
      ),
    );
    getIt.registerLazySingleton<ClearCartUseCase>(
      () => ClearCartUseCase(
        cartRepository: getIt.get<CartRepository>(),
      ),
    );
  }

  void _initOrdersHistory() {
    getIt.registerLazySingleton<OrdersHistoryRepository>(
      () => OrdersHistoryRepositoryImpl(
        firebaseFirestoreDataProvider: getIt.get<FirebaseFirestoreDataProvider>(),
        hiveProvider: getIt.get<HiveProvider>(),
      ),
    );
    getIt.registerLazySingleton<FetchOrdersHistoryUseCase>(
          () => FetchOrdersHistoryUseCase(
        ordersHistoryRepository: getIt.get<OrdersHistoryRepository>(),
      ),
    );
    getIt.registerLazySingleton<AddOrdersHistoryUseCase>(
      () => AddOrdersHistoryUseCase(
        ordersHistoryRepository: getIt.get<OrdersHistoryRepository>()
      ),
    );
  }

  void _initSettings() {
    getIt.registerLazySingleton<SettingsRepository>(
          () => SettingsRepositoryImpl(
        hiveProvider: getIt.get<HiveProvider>(),
      ),
    );

    getIt.registerLazySingleton<CheckFontSizeUseCase>(
          () => CheckFontSizeUseCase(
        settingsRepository: getIt.get<SettingsRepository>(),
      ),
    );

    getIt.registerLazySingleton<SetFontSizeUseCase>(
          () => SetFontSizeUseCase(
        settingsRepository: getIt.get<SettingsRepository>(),
      ),
    );

    getIt.registerLazySingleton<CheckThemeModeUseCase>(
          () => CheckThemeModeUseCase(
        settingsRepository: getIt.get<SettingsRepository>(),
      ),
    );

    getIt.registerLazySingleton<CheckThemeTypeUseCase>(
          () => CheckThemeTypeUseCase(
        settingsRepository: getIt.get<SettingsRepository>(),
      ),
    );

    getIt.registerLazySingleton<SetThemeModeUseCase>(
          () => SetThemeModeUseCase(
        settingsRepository: getIt.get<SettingsRepository>(),
      ),
    );

    getIt.registerLazySingleton<SetThemeTypeUseCase>(
          () => SetThemeTypeUseCase(
        settingsRepository: getIt.get<SettingsRepository>(),
      ),
    );
  }

  void _initAuthentication() {
    getIt.registerLazySingleton<AuthenticationRepository>(
          () => AuthenticationRepositoryImpl(
        firebaseAuthProvider: getIt.get<FirebaseAuthProvider>(),
        hiveProvider: getIt.get<HiveProvider>(),
      ),
    );
    getIt.registerLazySingleton<SignInUseCase>(
          () => SignInUseCase(
        authenticationRepository: getIt.get<AuthenticationRepository>(),
      ),
    );
    getIt.registerLazySingleton<SignUpUseCase>(
          () => SignUpUseCase(
        authenticationRepository: getIt.get<AuthenticationRepository>(),
      ),
    );
    getIt.registerLazySingleton<SignOutUseCase>(
          () => SignOutUseCase(
        authenticationRepository: getIt.get<AuthenticationRepository>(),
      ),
    );
    getIt.registerLazySingleton<ResetPasswordUseCase>(
          () => ResetPasswordUseCase(
        authenticationRepository: getIt.get<AuthenticationRepository>(),
      ),
    );
    getIt.registerLazySingleton<GetUserFromStorageUseCase>(
          () => GetUserFromStorageUseCase(
        authenticationRepository: getIt.get<AuthenticationRepository>(),
      ),
    );
  }

  void _initAdminPanel() {
    getIt.registerLazySingleton<AdminPanelRepository>(
          () => AdminPanelRepositoryImpl(
        firebaseFirestoreDataProvider:
        getIt.get<FirebaseFirestoreDataProvider>(),
      ),
    );
    getIt.registerLazySingleton<UpdateDishUseCase>(
          () => UpdateDishUseCase(
        adminPanelRepository: getIt.get<AdminPanelRepository>(),
      ),
    );
    getIt.registerLazySingleton<FetchAllUsersUseCase>(
          () => FetchAllUsersUseCase(
        adminPanelRepository: getIt.get<AdminPanelRepository>(),
      ),
    );
    getIt.registerLazySingleton<UpdateUserRoleUseCase>(
          () => UpdateUserRoleUseCase(
        adminPanelRepository: getIt.get<AdminPanelRepository>(),
      ),
    );
    getIt.registerLazySingleton<FetchAllOrdersUseCase>(
          () => FetchAllOrdersUseCase(
        adminPanelRepository: getIt.get<AdminPanelRepository>(),
      ),
    );
    getIt.registerLazySingleton<DeleteDishUseCase>(
          () => DeleteDishUseCase(
        adminPanelRepository: getIt.get<AdminPanelRepository>(),
      ),
    );
    getIt.registerLazySingleton<UpdateOrderStatusUseCase>(
          () => UpdateOrderStatusUseCase(
        adminPanelRepository: getIt.get<AdminPanelRepository>(),
      ),
    );
  }
}