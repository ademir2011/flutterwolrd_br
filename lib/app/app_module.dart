import 'package:flutterwolrd_br/app/components/components.dart';
import 'package:flutterwolrd_br/app/modules/login/login_module.dart';
import 'package:flutterwolrd_br/app/modules/signup/signup_controller.dart';
import 'package:flutterwolrd_br/app/modules/signup/signup_module.dart';
import 'package:flutterwolrd_br/app/pages/splash/splash_controller.dart';
import 'package:flutterwolrd_br/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutterwolrd_br/app/app_widget.dart';
import 'package:flutterwolrd_br/app/pages/splash/splash_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashController()),
        Bind((i) => Components()),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SplashPage()),
        Router('/login', module: LoginModule()),
        Router('/signup', module: SignupModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
