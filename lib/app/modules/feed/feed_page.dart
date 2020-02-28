import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterwolrd_br/app/modules/feed/services/youtube_api_service.dart';
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
  List<VideoPlayerController> _controller = List<VideoPlayerController>();
  // Future<void> _initializeVideoPlayerFuture;
  YoutubeApiService youtubeApiService = YoutubeApiService();

  Future<dynamic> updateAllVideos() async {
    return await youtubeApiService.getAllFlutterVideos();
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
            child: FutureBuilder(
              future: updateAllVideos(),
              builder: (c, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    itemCount: snapshot.data['items'].length,
                    itemBuilder: (c, i) {
                      _controller.add(
                        VideoPlayerController.network(
                          'https://www.youtube.com/watch?v=' +
                              snapshot.data['items'][i]['id']['videoId'],
                        ),
                      );

                      return Card(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: FutureBuilder(
                            future: _controller[i].initialize(),
                            builder: (c, s) {
                              if (s.connectionState == ConnectionState.done) {
                                print('>>>>>>>>>' + s.hasData.toString());
                                return AspectRatio(
                                  aspectRatio: _controller[i].value.aspectRatio,
                                  child: VideoPlayer(_controller[i]),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ));
  }
}
