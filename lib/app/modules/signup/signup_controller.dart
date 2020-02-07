import 'package:mobx/mobx.dart';

part 'signup_controller.g.dart';

class SignupController = _SignupBase with _$SignupController;

abstract class _SignupBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
