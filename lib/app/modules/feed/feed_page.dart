import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterwolrd_br/app/modules/feed/services/youtube_api_service.dart';
import 'package:flutterwolrd_br/app/shared/auth/auth_controller.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';
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
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(10.0),
          child: FutureBuilder(
            future: controller.getAllFlutterVideos(),
            builder: (c, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                for (var item in snapshot.data['items']) {
                  controller.addYoutubePlayerController(
                    initialVideoId: item['id']['videoId'],
                  );
                }

                return ListView.builder(
                  itemCount: controller.yt_controllers.length,
                  itemBuilder: (c, i) {
                    return Card(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          // child: Observer(
                          //   builder: (c) {
                          //     return YoutubePlayer(
                          //       controller: controller.yt_controllers[i],
                          //       showVideoProgressIndicator: true,
                          //     );
                          //   },
                          // ),
                          child: Text('teste  -> $i'),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.yt_controllers[0].play();
        },
      ),
    );
  }
}
