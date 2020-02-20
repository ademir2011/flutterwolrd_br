import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterwolrd_br/app/components/components.dart';
import 'package:flutterwolrd_br/app/pages/splash/splash_controller.dart';
import 'package:flutterwolrd_br/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController splashController = Modular.get();

  ReactionDisposer disposer;
  @override
  void initState() {
    super.initState();
    disposer = autorun((_) => splashController.passToScreen(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: Components.backgroundDecoration(),
        child: Center(
          child: Text(
            'Flutter Wolrd',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    disposer();
  }
}
