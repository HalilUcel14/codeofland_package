import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../../codeofland.dart';

class FirebaseAuthManager extends FirebaseAuthService {
  static FirebaseAuthManager? _of;
  static FirebaseAuthManager of({required FirebaseAuth auth}) =>
      _of ??= FirebaseAuthManager._(auth);
  FirebaseAuthManager._(this.auth);
  // ----------------------
  final FirebaseAuth auth;
  //

  @override
  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
    Function? createSuccessOption,
    Function? weakPasswordOption,
    Function? alreadyExistOption,
    Function? catchErrorOption,
  }) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      createSuccessOption;
      return credential.user;
    } on FirebaseAuthException catch (error) {
      firebaseAuthOnCacthError(
        error,
        weakPasswordOption: weakPasswordOption,
        alreadyEmailExistOption: alreadyExistOption,
      );
    } catch (e) {
      catchOnError(e, catchErrorOption: catchErrorOption);
    }
    return null;
  }

  @override
  Future<User?> signInAnonymously({
    Function? onSuccessOption,
    Function? catchErrorOption,
  }) async {
    try {
      UserCredential credential = await auth.signInAnonymously();
      onSuccessOption;
      return credential.user;
    } catch (e) {
      catchOnError(' Sign In Anonimously was Error: $e',
          catchErrorOption: catchErrorOption);
    }
    return null;
  }

  @override
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
    Function? onSuccessOption,
    Function? userNotFound,
    Function? wrongPassword,
    Function? catchErrorOption,
  }) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      onSuccessOption;
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      firebaseAuthOnCacthError(
        e,
        userNotFound: userNotFound,
        wrongPassword: wrongPassword,
      );
    } catch (e) {
      catchOnError(' Sign In Email was Error: $e',
          catchErrorOption: catchErrorOption);
    }
    return null;
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }

  Future<void> deleteUser() async {
    try {
      if (auth.currentUser != null) {
        await auth.currentUser!.delete();
        if (kDebugMode) print('User Deleted');
      }
    } on FirebaseAuthException catch (e) {
      firebaseAuthOnCacthError(e);
    } catch (e) {
      catchOnError(e);
    }
  }

  Future<UserCredential?> reAuthenticationWithCredential(
      AuthCredential credential) async {
    if (auth.currentUser == null) return null;
    final userCredential =
        await auth.currentUser!.reauthenticateWithCredential(credential);
    return userCredential;
  }

  // ---------------------- [Listen Methods] ----------------------------
  // ---------------------------------------------------------------------
  @override
  Stream<User?> get authStateChange => auth.authStateChanges();

  /// Aşağıdakiler gerçekleştiğinde olaylar tetiklenir:
  /// * Dinleyici kaydedildikten hemen sonra.
  /// * Bir kullanıcı oturum açtığında.
  /// * Geçerli kullanıcının oturumu kapatıldığında.
  authStateListen({
    Function? onUserExist,
    Function? onUserNull,
  }) {
    authStateChange.listen((User? user) {
      if (user == null) {
        if (kDebugMode) print('User is currently signed out');
        onUserExist;
      } else {
        if (kDebugMode) print('User is signed in');
        onUserNull;
      }
    });
  }

  /// Aşağıdakiler gerçekleştiğinde olaylar tetiklenir:
  /// * Dinleyici kaydedildikten hemen sonra.
  /// * Bir kullanıcı oturum açtığında.
  /// * Geçerli kullanıcının oturumu kapatıldığında.
  /// * Geçerli kullanıcının belirtecinde bir değişiklik olduğunda.
  authIdTokenChanges({
    Function? onUserNull,
    Function? onUserExist,
  }) {
    auth.idTokenChanges().listen((User? user) {
      if (user == null) {
        if (kDebugMode) print('User is currently signed out');
        onUserNull;
      } else {
        if (kDebugMode) print('User is signed in');
        onUserExist;
      }
    });
  }

  ///
  /// Aşağıdakiler gerçekleştiğinde olaylar tetiklenir:
  /// * Dinleyici kaydedildikten hemen sonra.
  /// * Bir kullanıcı oturum açtığında.
  /// * Geçerli kullanıcının oturumu kapatıldığında.
  /// * Geçerli kullanıcının belirtecinde bir değişiklik olduğunda.
  /// * FirebaseAuth.instance.currentUser tarafından sağlanan aşağıdaki yöntemler çağrıldığında:
  ///     * reload()
  ///     * unlink()
  ///     * updateEmail()
  ///     * updatePassword()
  ///     * updatePhoneNumber()
  ///     * updateProfile()
  authOnUserChanges({
    Function? onUserNull,
    Function? onUserExist,
  }) {
    auth.userChanges().listen((User? user) {
      if (user == null) {
        if (kDebugMode) print('User is currently signed out');
        onUserNull;
      } else {
        if (kDebugMode) print('User is signed in');
        onUserExist;
      }
    });
  }

  // ---------------------- [User Methods] ----------------------------
  // ---------------------------------------------------------------------

  User? get currentUser => auth.currentUser;

  Future<void> sendEmailVerification() async {
    User? user = currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  Future<void> updateDisplayName(String displayName) async {
    if (displayName.isEmpty) return;
    if (currentUser == null) return;
    await currentUser!.updateDisplayName(displayName);
  }

  Future<void> updateImageUrl(String photoURL) async {
    if (photoURL.isEmpty) return;
    if (currentUser == null) return;
    if (photoURL.isValidUrlRegex) {
      await currentUser!.updatePhotoURL(photoURL);
    }
  }

  Future<void> updateEmail(String emailAddress) async {
    if (emailAddress.isEmpty) return;
    if (currentUser == null) return;
    if (emailAddress.isValidEmailRegex) {
      await currentUser!.updateEmail(emailAddress);
    }
  }

  Future<void> updatePassword(String password) async {
    if (password.isEmpty) return;
    if (currentUser == null) return;
    if (password.isValidMediumPassword) {
      try {
        await currentUser!.updatePassword(password);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
        } else if (e.code == 'requires-recent-login') {
          if (kDebugMode) print(' Something Went Wrong  $e');
        }
      } catch (e) {
        if (kDebugMode) print(' Something Went Wrong  $e');
      }
    }
  }
}

void firebaseAuthOnCacthError(
  FirebaseAuthException error, {
  Function? weakPasswordOption,
  Function? alreadyEmailExistOption,
  Function? userNotFound,
  Function? wrongPassword,
}) {
  switch (error.code) {
    case 'weak-password':
      if (kDebugMode) print('The password provided is too weak.');
      weakPasswordOption;
      throw CustomFirebaseAuthException('The password provided is too weak.');
    case 'email-already-in-use':
      if (kDebugMode) print('The account already exists for that email.');
      alreadyEmailExistOption;
      throw CustomFirebaseAuthException('email-already-in-use');
    case 'user-not-found':
      if (kDebugMode) print('No user found for that email.');

      userNotFound;
      throw CustomFirebaseAuthException('No user found for that email.');
    case 'wrong-password':
      if (kDebugMode) print('Wrong password provided for that user.');
      wrongPassword;
      throw CustomFirebaseAuthException(
          'Wrong password provided for that user.');
    case 'requires-recent-login':
      if (kDebugMode) {
        print(
            'The user must reauthenticate before this operation can be executed.');
      }
      throw CustomFirebaseAuthException(
          'The user must reauthenticate before this operation can be executed.');
  }
}

void catchOnError(error, {Function? catchErrorOption}) {
  if (kDebugMode) print(error);
  catchErrorOption;
  throw CustomFirebaseAuthException('Something Went Wrong $error');
}
