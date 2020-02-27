import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterwolrd_br/app/shared/auth/auth_controller.dart';
import 'package:video_player/video_player.dart';
import 'feed_controller.dart';

class FeedPage extends StatefulWidget {
  final String title;
  const FeedPage({Key key, this.title = "Feed"}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends ModularState<FeedPage, FeedController> {
  final AuthController authController = Modular.get();
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    _initializeVideoPlayerFuture = _controller.initialize();
  }

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
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (c, i) {
                return Card(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: FutureBuilder(
                      future: _initializeVideoPlayerFuture,
                      builder: (c, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          _controller.play();
                          return AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
