import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:recurrence/models/recurrence.dart';
import 'package:recurrence/utilities/datetime_extensions.dart';

void main() {
  group('interval_month:', () {
    group('ctor', () {
      test('does not accept interval value less than one', () {
        expect(() => IntervalMonth(0, DateTime.now()), throwsArgumentError);
      });

      test('accepts values greater than 0', () {
        final IntervalMonth rule = IntervalMonth(1, DateTime.now());
        expect(rule, isInstanceOf<IntervalMonth>());
      });
    });

    group('properties return correct value', () {
      final int interval = 10;
      final DateTime startsOn = DateTime.now();
      final int month = startsOn.month;
      final int day = startsOn.day;
      final IntervalMonth rule = IntervalMonth(interval, startsOn);

      test('- interval', () {
        expect(rule.interval, equals(interval));
      });

      test('- startingMonth', () {
        expect(rule.startingMonth, equals(month));
      });

      test('- day', () {
        expect(rule.day, equals(day));
      });
    });

    test('does not occur before start date', () {
      final DateTime startsOn = DateTime.now();
      final DateTime yesterday = startsOn.subtract(Duration(days: 1));
      final IntervalMonth rule = IntervalMonth(1, startsOn);
      final bool occursYesterday = rule.occursOn(yesterday);

      expect(occursYesterday, isFalse);
    });

    test('does not occur on different day of month', () {
      final int interval = 1;
      final int dayOfMonth = 10;
      final DateTime startsOn = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        dayOfMonth,
      );
      final int daysInMonth = startsOn.daysInMonth;
      final IntervalMonth rule = IntervalMonth(interval, startsOn);

      for (int i = 0; i < daysInMonth; i++) {
        if (i + 1 == dayOfMonth) {
          continue;
        }

        final DateTime date = DateTime(
          DateTime.now().year,
          DateTime.now().month + 1,
          i + 1,
        );

        final bool occursOnDate = rule.occursOn(date);
        expect(occursOnDate, isFalse);
      }
    });

    test('occurs on correct interval', () {
      final Random random = Random();
      final int interval = random.nextInt(10);
      final DateTime startsOn = DateTime.now();
      final IntervalMonth rule = IntervalMonth(interval, startsOn);

      final DateTime future = DateTime(
        DateTime.now().year,
        DateTime.now().month + interval,
        DateTime.now().day,
      );

      final bool occursInFuture = rule.occursOn(future);

      expect(occursInFuture, isTrue);
    });
  });
}
