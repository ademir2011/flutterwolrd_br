import 'package:dio/dio.dart';

class YoutubeApiRepository {
  Future getAllVideosByName(Dio client) async {
    final String KEY = 'AIzaSyCS5yejFlkUBl5DjTcaLKsl0aqfuWh3YUE';

    final response = await client.get(
      'https://www.googleapis.com/youtube/v3/search',
      queryParameters: {
        'key': KEY,
        'part': 'id',
        'maxResults': 10,
        'order': 'relevance',
        'q': 'flutter',
        'type': 'video'
      },
    );
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
