import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@Riverpod(keepAlive: true)
class AuthRepository extends _$AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get user => _firebaseAuth.currentUser;
  bool get isLoggedIn => user != null;

  @override
  User? build() => user;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<UserCredential> signUp(String email, String password) async =>
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

  Future<void> signIn(String email, String password) async =>
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

  Future<void> signOut() async => await _firebaseAuth.signOut();
}
