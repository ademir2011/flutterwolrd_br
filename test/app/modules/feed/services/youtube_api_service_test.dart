import 'package:flutter_test/flutter_test.dart';

import 'package:flutterwolrd_br/app/modules/feed/services/youtube_api_service.dart';

void main() {
  YoutubeApiService service;

  setUp(() {
    service = YoutubeApiService();
  });

  group('YoutubeApiService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<YoutubeApiService>());
    });
  });
}
