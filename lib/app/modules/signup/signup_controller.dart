import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterwolrd_br/app/modules/login/model/user_model.dart';
import 'package:flutterwolrd_br/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'signup_controller.g.dart';

class SignupController = _SignupBase with _$SignupController;

abstract class _SignupBase with Store {
  var authController = Modular.get<AuthController>();

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @observable
  SignUpStatus accountCreated = SignUpStatus.notCreated;

  @action
  void setEmail(email) => this.email = email;

  @action
  void setPassword(password) => this.password = password;

  @action
  void setConfirmPassword(confirmPassword) =>
      (this.confirmPassword = confirmPassword);

  @computed
  bool get isButtonDisabled {
    return validateEmail() == null && validatePassword() == null;
  }

  String validateEmail() {
    if (email.isEmpty) return 'Vazio';

    if (!RegExp('[^@]+@[^\.]+\..+').hasMatch(email)) return 'E-mail incorreto';

    return null;
  }

  String validatePassword() {
    if (password.isEmpty) return 'Vazio';
    return null;
  }

  @action
  void cadastrar() {
    authController
        .createAccount(UserModel(email: this.email, password: this.password))
        .then((_) {
      accountCreated = SignUpStatus.created;
      Modular.to.pushReplacementNamed('/feed');
    }).catchError(
      (e) {
        print(e);
        accountCreated = SignUpStatus.errorOnCreated;
        Modular.to.pushReplacementNamed('/login');
      },
    );
  }
}

enum SignUpStatus { created, errorOnCreated, notCreated }
