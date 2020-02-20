import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterwolrd_br/app/modules/login/model/user_model.dart';

abstract class AuthRepositoryInterface {
  Future googleSignIn();
  Future googleLogout();
  Future<FirebaseUser> getUser();
  Future<FirebaseUser> createAccount(UserModel userModel);
}
