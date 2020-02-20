import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterwolrd_br/app/modules/login/model/user_model.dart';
import 'package:flutterwolrd_br/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository extends AuthRepositoryInterface {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<FirebaseUser> googleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    return user;
  }

  @override
  Future googleLogout() async {
    _auth.signOut();
    return null;
  }

  @override
  Future<FirebaseUser> getUser() => _auth.currentUser();

  @override
  Future<FirebaseUser> createAccount(UserModel userModel) async =>
      (await _auth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      ))
          .user;
}
