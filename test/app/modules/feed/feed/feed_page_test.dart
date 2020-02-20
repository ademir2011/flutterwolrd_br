import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:flutterwolrd_br/app/modules/feed/feed/feed_page.dart';

main() {
  testWidgets('FeedPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(FeedPage(title: 'Feed')));
    final titleFinder = find.text('Feed');
    expect(titleFinder, findsOneWidget);
  });
}
