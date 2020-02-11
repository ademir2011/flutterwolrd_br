import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterwolrd_br/app/components/components.dart';
import 'package:flutterwolrd_br/app/pages/splash/splash_controller.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController splashController = Modular.get();
  final Components components = Modular.get();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashController.passToScreen(seconds: 2, page: '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: components.backgroundDecoration(),
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
}
