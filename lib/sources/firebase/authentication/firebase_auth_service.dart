import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthService {
  Stream<User?> get authStateChange;

  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<User?> createUserWithEmailAndPassword(
      {required String email, required String password});
  Future<void> signOut();
  Future<User?> signInAnonymously();
}
