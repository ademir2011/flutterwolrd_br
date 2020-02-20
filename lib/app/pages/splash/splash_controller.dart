import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterwolrd_br/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashBase with _$SplashController;

abstract class _SplashBase with Store {
  final auth = Modular.get<AuthController>();

  void passToScreen({int seconds}) async {
    Future.delayed(Duration(seconds: seconds)).then((_) {
      if (auth.status == AuthStatus.logoff) {
        Modular.to.pushReplacementNamed('/login');
      } else if (auth.status == AuthStatus.login) {
        Modular.to.pushReplacementNamed('/feed');
      }
    });
  }
}
