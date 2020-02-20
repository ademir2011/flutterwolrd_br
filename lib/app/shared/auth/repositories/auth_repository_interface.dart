import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepositoryInterface {
  Future googleSignIn();
  Future googleLogout();
  Future<FirebaseUser> getUser();
}
