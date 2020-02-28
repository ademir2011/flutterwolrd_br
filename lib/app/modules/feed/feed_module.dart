import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterwolrd_br/app/modules/feed/feed_controller.dart';
import 'package:flutterwolrd_br/app/modules/feed/feed_page.dart';
import 'package:flutterwolrd_br/app/modules/feed/repositories/youtube_api_repository.dart';
import 'package:flutterwolrd_br/app/modules/feed/services/youtube_api_service.dart';
import 'package:flutterwolrd_br/app/shared/auth/auth_controller.dart';

class FeedModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FeedController()),
        Bind((i) => AuthController()),
        Bind((i) => YoutubeApiService()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => FeedPage()),
      ];

  static Inject get to => Inject<FeedModule>.of();
}
