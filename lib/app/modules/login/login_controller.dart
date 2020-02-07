import 'package:mobx/mobx.dart';

import 'model/user_model.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {
  // @observable
  // UserModel userModel;

  @observable
  String email = '';

  @observable
  String password = '';

  // _LoginBase() {
  //   userModel.email = '';
  //   userModel.password = '';
  // }

  @action
  void setEmail(value) => email = value;

  @action
  void setPassword(value) => password = value;

  String validateEmail() => email.isEmpty ? 'Vazio' : null;
}
