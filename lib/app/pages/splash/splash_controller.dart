import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashBase with _$SplashController;

abstract class _SplashBase with Store {
  void passToScreen({int seconds, String page}) async {
    Future.delayed(Duration(seconds: seconds)).then((_) {
      Modular.to.pushReplacementNamed(page);
    });
  }
}
