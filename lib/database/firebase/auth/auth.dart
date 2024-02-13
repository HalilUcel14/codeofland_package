// import 'package:codeofland/codeofland.dart';
// import 'package:codeofland/sources/firebase/authentication/firebase_auth_manager.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// final class FirebaseAuthManager extends IFirebaseAuth {
//   static FirebaseAuthManager? _of;
//   static FirebaseAuthManager of({required FirebaseAuth auth}) =>
//       _of ??= FirebaseAuthManager._(auth);
//   FirebaseAuthManager._(this.auth);
//   //
//   final FirebaseAuth auth;

//   @override
//   Stream<User?> get authStateChange => auth.authStateChanges();

//   @override
//   Future<User?> createUserWithEmailAndPassword({
//     required String email,
//     required String password,
//   }) async {

//     try {
//       final credential = await auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return credential.user;
//     // ignore: empty_catches
//     } on FirebaseAuthException  {

//     } catch(error) {}


    
    
//   }

//   @override
//   Future<User?> signInAnonymously() {}

//   @override
//   Future<User?> signInWithEmailAndPassword({
//     required String email,
//     required String password,
//   }) {}

//   @override
//   Future<void> signOut() {}
// }
