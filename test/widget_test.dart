import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_test_widget/main.dart';

void main() {
  testWidgets('Toggle button changes text', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    //not tap
    expect(find.text('Button Not Pressed'), findsOneWidget);

    //tap 1
    await tester.tap(find.widgetWithText(ElevatedButton, "Press Me"));
    await tester.pump();

    final Finder redWidget = find.byWidgetPredicate((widget) {
      if (widget is Container && widget.color == Colors.green) {
        return true;
      }
      return false;
    });

    expect(redWidget, findsOneWidget);
    // await tester.tap(find.byType(ElevatedButton));
    expect(find.text('Button Pressed'), findsOneWidget);

    //tap2
    await tester.tap(find.widgetWithText(ElevatedButton, "Press Me"));
    await tester.pump();

    expect(find.text('Button Not Pressed'), findsOneWidget);
  });
}
