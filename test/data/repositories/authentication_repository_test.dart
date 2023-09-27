import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../test_tools/mocks.dart';

final UserEntity userEntity = UserMapper.toEntity(userModel);
const UserModel userModel = UserModel(
  identifierId: '25',
  email: 'developer@gmail.com',
  userName: 'developer',
  role: 'user',
);

void main() {
  late FirebaseAuthProviderMock firebaseAuthProviderMock;
  late HiveProviderMock hiveProviderMock;
  late AuthenticationRepository authenticationRepository;
  late MockUserModel mockUserModel;
  setUp(() {
    mockUserModel = MockUserModel();
    firebaseAuthProviderMock = FirebaseAuthProviderMock();
    hiveProviderMock = HiveProviderMock();
    authenticationRepository = AuthenticationRepositoryImpl(
      firebaseAuthProvider: firebaseAuthProviderMock,
      hiveProvider: hiveProviderMock,
    );
    registerFallbackValue(mockUserModel);
  },
);

  test('Calling SignIn method, return UserModel?', () async {
    when(
          () => firebaseAuthProviderMock.signInWithEmailAndPassword(
        email: 'developer@gmail.com',
        password: 'developer',
      ),
    ).thenAnswer((_) async => userEntity);
    when(() => hiveProviderMock.saveUserToLocal(any()))
        .thenAnswer((_) async => Future.value());
    expect(
      await authenticationRepository.signIn(
        email: 'developer@gmail.com',
        password: 'developer',
      ),
      isA<UserModel>(),
    );
  },
);

  test('Calling SignUp method, return UserModel?', () async {
    when(
      () => firebaseAuthProviderMock.signUpWithEmailAndPassword(
        userName: 'developer',
        email: 'developer@gmail.com',
        password: 'developer',
      ),
    ).thenAnswer((_) async => userEntity);
    when(() => hiveProviderMock.saveUserToLocal(any()))
        .thenAnswer((_) async => Future.value());
    expect(
      await authenticationRepository.signUp(
        userName: 'developer',
        email: 'developer@gmail.com',
        password: 'developer',
      ),
      isA<UserModel>(),
    );
  },
);


  test('Check that SignOut called one time, and hiveProvider clean', () async {
    when(() => firebaseAuthProviderMock.signOut())
        .thenAnswer((_) => Future.value());
    when(() => hiveProviderMock.deleteUserFromLocal())
        .thenAnswer((_) => Future.value());
    await authenticationRepository.signOut();
    verify(() => firebaseAuthProviderMock.signOut()).called(1);
    verify(() => hiveProviderMock.deleteUserFromLocal()).called(1);
    },
  );
}
