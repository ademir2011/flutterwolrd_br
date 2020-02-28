import 'package:flutterwolrd_br/app/modules/feed/feed_module.dart';
import 'package:flutterwolrd_br/app/modules/feed/services/youtube_api_service.dart';
import 'package:flutterwolrd_br/app/modules/feed/repositories/youtube_api_repository.dart';
import 'package:flutterwolrd_br/app/shared/auth/auth_controller.dart';
import 'package:flutterwolrd_br/app/components/components.dart';
import 'package:flutterwolrd_br/app/modules/login/login_module.dart';
import 'package:flutterwolrd_br/app/modules/signup/signup_module.dart';
import 'package:flutterwolrd_br/app/pages/splash/splash_controller.dart';
import 'package:flutterwolrd_br/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutterwolrd_br/app/app_widget.dart';
import 'package:flutterwolrd_br/app/pages/splash/splash_page.dart';
import 'package:flutterwolrd_br/app/shared/auth/repositories/auth_repository.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => YoutubeApiService()),
        Bind((i) => YoutubeApiRepository()),
        Bind((i) => AuthController()),
        Bind((i) => AuthRepository()),
        Bind((i) => SplashController()),
        Bind((i) => Components()),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: FeedModule()),
        // Router('/', child: (_, args) => SplashPage()),
        Router('/login', module: LoginModule()),
        Router('/signup', module: SignupModule()),
        Router('/feed', module: FeedModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
