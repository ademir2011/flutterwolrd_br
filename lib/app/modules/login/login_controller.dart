import 'package:mobx/mobx.dart';

import 'model/user_model.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {
  UserModel userModel;

  @observable
  String email = '';

  @observable
  String password = '';

  // @computed
  // bool validated =

  _LoginBase() {
    userModel = UserModel(
      email: '',
      password: '',
      actived: true,
      name: '',
      passwordConfirm: '',
    );
  }

  @action
  void setEmail(value) {
    userModel.email = value;
    email = value;
  }

  @action
  void setPassword(value) {
    userModel.password = value;
    password = value;
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
}
