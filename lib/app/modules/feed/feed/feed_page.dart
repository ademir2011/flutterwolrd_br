import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterwolrd_br/app/shared/auth/auth_controller.dart';
import 'feed_controller.dart';

class FeedPage extends StatefulWidget {
  final String title;
  const FeedPage({Key key, this.title = "Feed"}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends ModularState<FeedPage, FeedController> {
  final AuthController authController = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            authController.logout();
            Modular.to.pushReplacementNamed('/login');
          },
        ),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
