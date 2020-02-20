import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutterwolrd_br/app/modules/feed/feed/feed_controller.dart';
import 'package:flutterwolrd_br/app/modules/feed/feed/feed_module.dart';

void main() {
  initModule(FeedModule());
  FeedController feed;

  setUp(() {
    feed = FeedModule.to.get<FeedController>();
  });

  group('FeedController Test', () {
    test("First Test", () {
      expect(feed, isInstanceOf<FeedController>());
    });

    test("Set Value", () {
      expect(feed.value, equals(0));
      feed.increment();
      expect(feed.value, equals(1));
    });
  });
}
