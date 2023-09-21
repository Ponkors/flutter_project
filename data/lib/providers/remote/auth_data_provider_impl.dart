part of 'auth_data_provider.dart';

class AuthenticationDataProviderImpl implements AuthenticationDataProvider {
  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  const AuthenticationDataProviderImpl({
    required GoogleSignIn googleSignIn,
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firebaseFirestore,
  })  : _googleSignIn = googleSignIn,
        _firebaseAuth = firebaseAuth,
        _firebaseFirestore = firebaseFirestore;

  @override
  Future<UserEntity> signUpWithEmailAndPassword({
    required String userName,
    required String email,
    required String password,
  }) async {
    final UserCredential credential =
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await saveUser(
      identifierId: credential.user?.uid ?? '',
      userName: userName,
      email: credential.user?.email ?? '',
    );
    final UserEntity userEntity = await getUser(
      identifierId: credential.user?.uid ?? '',
    );
    return userEntity;
  }

  @override
  Future<UserEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final UserCredential credential =
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final UserEntity userEntity = await getUser(
      identifierId: credential.user?.uid ?? '',
    );
    return userEntity;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }

  @override
  Future<UserEntity> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final UserCredential userCredential =
    await _firebaseAuth.signInWithCredential(credential);
    await saveUser(
      identifierId: userCredential.user?.uid ?? '',
      userName: userCredential.user?.displayName ?? '',
      email: userCredential.user?.email ?? '',
    );
    final UserEntity userEntity = await getUser(
      identifierId: userCredential.user?.uid ?? '',
    );
    return userEntity;
  }

  @override
  Future<void> resetPassword({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> saveUser({
    required String identifierId,
    required String? userName,
    required String? email,
  }) async {
    final DocumentReference<Map<String, dynamic>> userDataFirebase =
    _firebaseFirestore.collection('users').doc(
      identifierId,
    );
    final Map<String, String?> userData = {
      'identifierId': identifierId,
      'name': userName,
      'email': email,
    };
    final DocumentSnapshot<Map<String, dynamic>> user =
    await userDataFirebase.get();
    if (!user.exists) {
      userDataFirebase.set(userData);
    }
  }

  @override
  Future<UserEntity> getUser({
    required String identifierId,
  }) async {
    final DocumentSnapshot<Map<String, dynamic>> userDoc =
    await _firebaseFirestore.collection('users').doc(identifierId).get();
    final Map<String, dynamic>? userData = userDoc.data();
    final UserEntity userEntity = UserEntity(
      identifierId: identifierId,
      email: userData?['email'] ?? '',
      userName: userData?['name'] ?? '',
    );
    return userEntity;
  }
}