import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GetIt getIt = GetIt.instance;
final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    _initFirebaseOptions();
    _initFirebase();
    _initDataProvider();
    _initGoogleSignIn();
    _initAuthenticationDataProvider();
    _initLocalDataProvider();
    _initDishes();
    _initHive();
    _initHiveAdapter();
    _initSettings();
    _initSettingsPreferencesProvider();
    _initCart();
    _initAuthentication();
  }

  void _initFirebaseOptions() {
    getIt.registerLazySingleton<FirebaseOptions>(
      () => DefaultFirebaseOptions.currentPlatform,
    );
  }

  Future<void> _initFirebase() async {
    await Firebase.initializeApp(
      options: getIt<FirebaseOptions>(),
    );
    getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance,
    );
    getIt.registerLazySingleton<FirebaseAuth>(
      () => FirebaseAuth.instance,
    );
    FirebaseFirestore.instance.clearPersistence();
  }

  Future<void> _initGoogleSignIn() async {
    getIt.registerLazySingleton<GoogleSignIn>(
      () => GoogleSignIn(),
    );
  }

  void _initHiveAdapter() {
    getIt.registerLazySingleton<DishEntityAdapter>(
      () => DishEntityAdapter(),
    );
    getIt.registerLazySingleton<CartDishEntityAdapter>(
      () => CartDishEntityAdapter(),
    );
    getIt.registerLazySingleton<UserEntityAdapter>(
      () => UserEntityAdapter(),
    );
  }

  Future<void> _initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(
      getIt.get<DishEntityAdapter>(),
    );
    Hive.registerAdapter(
      getIt.get<CartDishEntityAdapter>(),
    );
    Hive.registerAdapter(
      getIt.get<UserEntityAdapter>(),
    );
  }


  void _initDataProvider() {
    getIt.registerLazySingleton<DataProvider>(
      () => DataProviderImpl(
        FirebaseFirestore.instance,
      ),
    );
  }

  void _initLocalDataProvider() {
    getIt.registerLazySingleton<LocalDataProvider>(
      () => LocalDataProviderImpl(),
    );
    getIt.registerLazySingleton<CartLocalDataProvider>(
      () => CartLocalDataProvider(),
    );
    getIt.registerLazySingleton<AuthenticationLocalDataProvider>(
      () => AuthenticationLocalDataProviderImpl(),
    );
  }

  void _initAuthenticationDataProvider() {
    getIt.registerLazySingleton<AuthenticationDataProvider>(
      () => AuthenticationDataProviderImpl(
        googleSignIn: getIt.get<GoogleSignIn>(),
        firebaseAuth: getIt.get<FirebaseAuth>(),
        firebaseFirestore: getIt.get<FirebaseFirestore>(),
      ),
    );
  }

  void _initDishes() {
    getIt.registerLazySingleton<DishesRepository>(
          () => DishesRepositoryImpl(
        dataProvider: getIt.get<DataProvider>(),
        localDataProvider: getIt.get<LocalDataProvider>(),
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
        cartLocalDataProvider: getIt.get<CartLocalDataProvider>(),
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
  }

  void _initSettingsPreferencesProvider() {
    getIt.registerLazySingleton<SettingsPreferencesProvider>(
      () => SettingsPreferencesProvider()
    );
  }

  void _initSettings() {
    getIt.registerLazySingleton<SettingsRepository>(
          () => SettingsRepositoryImpl(
        settingsPreferencesProvider: getIt.get<SettingsPreferencesProvider>(),
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
        authenticationDataProvider: getIt.get<AuthenticationDataProvider>(),
        authenticationLocalDataProvider: getIt.get<AuthenticationLocalDataProvider>(),
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
    getIt.registerLazySingleton<SignInWithGoogleUseCase>(
          () => SignInWithGoogleUseCase(
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
}