import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:recurrence/models/recurrence.dart';

void main() {
  group('interval_date: ', () {
    group('ctor', () {
      test('rejects values less than 1', () {
        expect(() => IntervalDate(0, DateTime.now()), throwsArgumentError);
      });

      test('accepts values of 1 or more', () {
        for (int i = 0; i < 3; i++) {
          final rule = IntervalDate(i + 1, DateTime.now());
          expect(rule, isInstanceOf<IntervalDate>());
        }
      });
    });

    test('does not occur yesterday', () {
      final int interval = 1;
      final IntervalDate rule = IntervalDate(interval, DateTime.now());
      final DateTime yesterday = DateTime.now().subtract(Duration(days: 1));
      final bool occursYesterday = rule.occursOn(yesterday);

      expect(occursYesterday, isFalse);
    });

    group('interval property', () {
      test('returns interval value', () {
        final int interval = 3;
        final IntervalDate rule = IntervalDate(interval, DateTime.now());

        expect(rule.interval, equals(interval));
      });
    });

    group('daily interval', () {
      final int interval = 1;
      final IntervalDate rule = IntervalDate(interval, DateTime.now());

      test('occurs tomorrow', () {
        final DateTime tomorrow = DateTime.now().add(Duration(days: 1));
        final bool occursTomorrow = rule.occursOn(tomorrow);

        expect(occursTomorrow, isTrue);
      });

      test('occurs in two days', () {
        final DateTime twoDays = DateTime.now().add(Duration(days: 2));
        final bool occursInTwoDays = rule.occursOn(twoDays);

        expect(occursInTwoDays, isTrue);
      });

      test('occurs on random date in the future', () {
        final Random random = Random();
        final int difference = random.nextInt(1000);
        final DateTime future = DateTime.now().add(Duration(days: difference));
        final bool occursInFuture = rule.occursOn(future);

        expect(occursInFuture, isTrue);
      });
    });

    group('every other day interval', () {
      final int interval = 2;
      final DateTime startsOn = DateTime.now();
      final IntervalDate rule = IntervalDate(interval, startsOn);

      bool occursIn(int numDays) {
        return rule.occursOn(startsOn.add(Duration(days: numDays)));
      }

      test('does not occur in one day', () {
        final bool occursInOneDay = occursIn(1);

        expect(occursInOneDay, isFalse);
      });

      test('occurs in two days', () {
        final bool occursInTwoDays = occursIn(2);

        expect(occursInTwoDays, isTrue);
      });

      test('does not occur in three days', () {
        final bool occursInThreeDays = occursIn(3);

        expect(occursInThreeDays, isFalse);
      });

      test('occurs in future on two-day interval', () {
        final Random random = Random();
        final int interval = random.nextInt(1000) * 2;
        final occursInFuture = occursIn(interval);

        expect(occursInFuture, isTrue);
      });
    });
  });
}
