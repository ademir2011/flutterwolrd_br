import 'package:mobx/mobx.dart';

part 'signup_controller.g.dart';

class SignupController = _SignupBase with _$SignupController;

abstract class _SignupBase with Store {
  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

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

  void cadastrar() {}
}
