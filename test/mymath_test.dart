// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:sample_unit_test/my_math.dart';

void main() {
  group('MyMath', () {
    test('isPrime', () {
      final myMath = MyMath();
      expect(myMath.isPrime(10), false);
      expect(myMath.isPrime(13), false);
      expect(myMath.isPrime(21), false);
    });
    // You can add more test cases for other methods or scenarios.
  });
}
