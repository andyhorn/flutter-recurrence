import 'package:flutter_test/flutter_test.dart';
import 'package:recurrence/models/recurrence.dart';
import 'package:recurrence/utilities/datetime_extensions.dart';

void main() {
  group('day_of_month_test:', () {
    group('every day rule:', () {
      final DateTime month = DateTime(2021, 06);
      final DayOfMonth rule = DayOfMonth([], month);

      test('isEveryDay is true', () {
        final bool isEveryDay = rule.isEveryDay;

        expect(isEveryDay, isTrue);
      });

      test('occurs on every day', () {
        final int daysInMonth = month.daysInMonth;
        bool occurs = false;

        for (int i = month.day; i <= daysInMonth; i++) {
          final DateTime date = DateTime(month.year, month.month, i);
          occurs = rule.occursOn(date);

          if (!occurs) {
            break;
          }
        }

        expect(occurs, isTrue);
      });
    });

    group('three days of month:', () {
      final DateTime month = DateTime(2021, 06);
      final List<int> days = [1, 15, 25];
      final DayOfMonth rule = DayOfMonth(days, month);

      test('isEveryDay is false', () {
        final bool isEveryDay = rule.isEveryDay;

        expect(isEveryDay, isFalse);
      });

      test('occurs on all three days', () {
        bool occurs = false;

        for (final int day in days) {
          occurs = rule.occursOn(DateTime(month.year, month.month, day));

          if (!occurs) {
            break;
          }
        }

        expect(occurs, isTrue);
      });

      test('does not occur on any other days', () {
        bool occurs = false;

        for (int i = month.day; i <= month.daysInMonth; i++) {
          if (days.contains(i)) {
            continue;
          }

          final DateTime date = DateTime(month.year, month.month, i);
          occurs = rule.occursOn(date);

          if (occurs) {
            break;
          }
        }

        expect(occurs, isFalse);
      });
    });

    group('negative indexing:', () {
      final DateTime startDate = DateTime(2021, 06);
      final List<int> days = [-1, -5];
      final List<int> expectedDates = [30, 26];
      final DayOfMonth rule = DayOfMonth(days, startDate);

      test('occurs on correct dates', () {
        final bool occurs = rule.occursOn(DateTime(
                startDate.year, startDate.month, expectedDates.first)) &&
            rule.occursOn(
                DateTime(startDate.year, startDate.month, expectedDates.last));

        expect(occurs, isTrue);
      });

      test('does not occur on any other dates', () {
        bool occurs = false;

        for (int i = startDate.day; i < startDate.daysInMonth; i++) {
          if (expectedDates.contains(i)) {
            continue;
          }

          occurs = rule.occursOn(DateTime(startDate.year, startDate.month, i));

          if (occurs) {
            break;
          }
        }

        expect(occurs, isFalse);
      });
    });
  });
}
