import 'package:codeofland/codeofland.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

@immutable
final class FirebaseInit {
  const FirebaseInit._();
//

  static final auth = FirebaseAuthManager.of(auth: FirebaseAuth.instance);
}
