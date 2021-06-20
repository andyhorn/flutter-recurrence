import 'package:flutter_test/flutter_test.dart';
import 'package:recurrence/models/recurrence.dart';

void main() {
  group('day of week test:', () {
    group('invalid values:', () {
      test('less than Monday throws error', () {
        expect(() => DayOfWeek([DateTime.monday - 1], DateTime.now()),
            throwsArgumentError);
      });

      test('greater than Sunday throws error', () {
        expect(() => DayOfWeek([DateTime.sunday + 1], DateTime.now()),
            throwsArgumentError);
      });

      test('list cannot be empty', () {
        expect(() => DayOfWeek([], DateTime.now()), throwsArgumentError);
      });
    });

    group('monday rule', () {
      final DateTime startsOn = DateTime(2021, 06, 01);
      final DayOfWeek rule = DayOfWeek([DateTime.monday], startsOn);

      test('occurs on monday', () {
        final DateTime monday = DateTime(2021, 06, 14);
        final bool occursOnMonday = rule.occursOn(monday);

        expect(occursOnMonday, isTrue);
      });

      test('does not occur on any other weekday', () {
        final List<DateTime> otherWeekdays = [
          DateTime(2021, 06, 15),
          DateTime(2021, 06, 16),
          DateTime(2021, 06, 17),
          DateTime(2021, 06, 18),
          DateTime(2021, 06, 19),
          DateTime(2021, 06, 20),
        ];

        expect(otherWeekdays.every((d) => !rule.occursOn(d)), isTrue);
      });
    });
  });
}
