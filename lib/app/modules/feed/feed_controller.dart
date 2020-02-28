import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterwolrd_br/app/modules/feed/services/youtube_api_service.dart';
import 'package:mobx/mobx.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'feed_controller.g.dart';

class FeedController = _FeedControllerBase with _$FeedController;

abstract class _FeedControllerBase with Store {
  final youtubeApiService = Modular.get<YoutubeApiService>();

  @observable
  ObservableList<YoutubePlayerController> yt_controllers =
      ObservableList<YoutubePlayerController>();

  @action
  void addYoutubePlayerController({String initialVideoId}) {
    yt_controllers.add(
      YoutubePlayerController(
        initialVideoId: initialVideoId,
        flags: YoutubePlayerFlags(
          autoPlay: false,
        ),
      ),
    );
  }

  Future getAllFlutterVideos() => youtubeApiService.getAllFlutterVideos();
}
