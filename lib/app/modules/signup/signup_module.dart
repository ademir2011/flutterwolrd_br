import 'package:flutterwolrd_br/app/modules/signup/signup_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterwolrd_br/app/modules/signup/signup_page.dart';

class SignupModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SignupController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SignupPage()),
      ];

  static Inject get to => Inject<SignupModule>.of();
}
