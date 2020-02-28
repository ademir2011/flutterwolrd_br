import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterwolrd_br/app/modules/feed/repositories/youtube_api_repository.dart';

class YoutubeApiService {
  final youtubeApiRepository = Modular.get<YoutubeApiRepository>();

  final Dio dio = Dio();

  Future<dynamic> getAllFlutterVideos() async {
    return await youtubeApiRepository.getAllVideosByName(dio);
  }
}
