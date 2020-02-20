import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterwolrd_br/app/modules/login/model/user_model.dart';
import 'package:flutterwolrd_br/app/shared/auth/repositories/auth_repository.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final AuthRepository _authRepository = Modular.get();

  @observable
  AuthStatus status = AuthStatus.loading;

  @observable
  FirebaseUser user;

  @action
  setUser(FirebaseUser value) {
    user = value;
    status = user == null ? AuthStatus.logoff : AuthStatus.login;
  }

  _AuthControllerBase() {
    _authRepository.getUser().then(setUser).catchError((_) => print('eroo'));
  }

  @action
  Future loginWithGoogle() async {
    user = await _authRepository.googleSignIn();
    Modular.to.pushReplacementNamed('/feed');
  }

  Future logout() async {
    await _authRepository.googleLogout();
  }

  @action
  Future createAccount(UserModel usermodel) async {
    user = await _authRepository.createAccount(usermodel);
  }
}

enum AuthStatus { login, logoff, loading }
