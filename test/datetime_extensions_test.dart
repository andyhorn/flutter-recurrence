import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:recurrence/utilities/datetime_extensions.dart';

void main() {
  group('daysInMonth', () {
    test('returns 31 in January', () {
      final DateTime jan = DateTime(2021, 01);
      final int daysInJan = jan.daysInMonth;

      expect(daysInJan, equals(31));
    });

    test('returns 28 in non-leap year February', () {
      final DateTime feb = DateTime(2021, 02);
      final int daysInFeb = feb.daysInMonth;

      expect(daysInFeb, equals(28));
    });

    test('returns 29 in leap-year February', () {
      final DateTime feb = DateTime(2020, 02);
      final int daysInFeb = feb.daysInMonth;

      expect(daysInFeb, equals(29));
    });

    test('returns 31 in March', () {
      final DateTime mar = DateTime(2021, 03);
      final int daysInMar = mar.daysInMonth;

      expect(daysInMar, equals(31));
    });

    test('returns 30 in April', () {
      final DateTime apr = DateTime(2021, 04);
      final int daysInApr = apr.daysInMonth;

      expect(daysInApr, equals(30));
    });

    test('returns 31 in May', () {
      final DateTime may = DateTime(2021, 05);
      final int daysInMay = may.daysInMonth;

      expect(daysInMay, equals(31));
    });

    test('returns 30 in June', () {
      final DateTime jun = DateTime(2021, 06);
      final int daysInJun = jun.daysInMonth;

      expect(daysInJun, equals(30));
    });

    test('returns 31 in July', () {
      final DateTime jul = DateTime(2021, 07);
      final int daysInJul = jul.daysInMonth;

      expect(daysInJul, equals(31));
    });

    test('returns 31 in August', () {
      final DateTime aug = DateTime(2021, 08);
      final int daysInAug = aug.daysInMonth;

      expect(daysInAug, equals(31));
    });

    test('returns 30 in September', () {
      final DateTime sep = DateTime(2021, 09);
      final int daysInSep = sep.daysInMonth;

      expect(daysInSep, equals(30));
    });

    test('returns 31 in October', () {
      final DateTime oct = DateTime(2021, 10);
      final int daysInOct = oct.daysInMonth;

      expect(daysInOct, equals(31));
    });

    test('returns 30 in November', () {
      final DateTime nov = DateTime(2021, 11);
      final int daysInNov = nov.daysInMonth;

      expect(daysInNov, equals(30));
    });

    test('returns 31 in December', () {
      final DateTime dec = DateTime(2021, 12);
      final int daysInDec = dec.daysInMonth;

      expect(daysInDec, equals(31));
    });
  });

  group('isSameDayAs(DateTime)', () {
    test('returns true for identical DateTimes', () {
      final DateTime dateOne = DateTime.now();
      final DateTime dateTwo = dateOne;

      final bool areEqual = dateOne.isSameDayAs(dateTwo);

      expect(areEqual, isTrue);
    });

    test('returns true for same year, month, and day', () {
      final Random r = Random();
      final DateTime dateOne =
          DateTime(2021, 01, 01, r.nextInt(24), r.nextInt(60), r.nextInt(60));
      final DateTime dateTwo =
          DateTime(2021, 01, 01, r.nextInt(24), r.nextInt(60), r.nextInt(60));

      final bool areSameDay = dateOne.isSameDayAs(dateTwo);

      expect(areSameDay, isTrue);
    });

    test('returns false for different year', () {
      final DateTime dateOne = DateTime(2021, 01, 01);
      final DateTime dateTwo = DateTime(2022, 01, 01);

      final bool areSameDay = dateOne.isSameDayAs(dateTwo);

      expect(areSameDay, isFalse);
    });

    test('returns false for different month', () {
      final DateTime dateOne = DateTime(2021, 01, 01);
      final DateTime dateTwo = DateTime(2021, 02, 01);

      final bool areSameDay = dateOne.isSameDayAs(dateTwo);

      expect(areSameDay, isFalse);
    });

    test('returns false for different day', () {
      final DateTime dateOne = DateTime(2021, 01, 01);
      final DateTime dateTwo = DateTime(2021, 01, 02);

      final bool areSameDay = dateOne.isSameDayAs(dateTwo);

      expect(areSameDay, isFalse);
    });
  });

  group('weekdays', () {
    test('first Friday of June 2021', () {
      final DateTime june = DateTime(2021, 06);
      final DateTime? firstFriday = june.weekdays(DateTime.friday).first;

      expect(firstFriday, isNotNull);
      expect(firstFriday?.day, equals(4));
    });

    test('second Friday of June 2021', () {
      final DateTime june = DateTime(2021, 06);
      final DateTime? secondFriday = june.weekdays(DateTime.friday)[1];

      expect(secondFriday, isNotNull);
      expect(secondFriday?.day, equals(11));
    });

    test('third Friday of June 2021', () {
      final DateTime june = DateTime(2021, 06);
      final DateTime? thirdFriday = june.weekdays(DateTime.friday)[2];

      expect(thirdFriday, isNotNull);
      expect(thirdFriday?.day, equals(18));
    });

    test('fourth Friday of June 2021', () {
      final DateTime june = DateTime(2021, 06);
      final DateTime? fourthFriday = june.weekdays(DateTime.friday)[3];

      expect(fourthFriday, isNotNull);
      expect(fourthFriday?.day, equals(25));
    });

    test('no fifth Friday of June 2021', () {
      final DateTime june = DateTime(2021, 06);

      expect(() => june.weekdays(DateTime.friday)[4], throwsRangeError);
    });

    test('last Friday of June 2021', () {
      final DateTime june = DateTime(2021, 06);
      final DateTime? lastFriday = june.weekdays(DateTime.friday)[-1];

      expect(lastFriday, isNotNull);
      expect(lastFriday?.day, equals(25));
    });

    test('second to last Friday of June 2021', () {
      final DateTime june = DateTime(2021, 06);
      final DateTime? secondToLastFriday = june.weekdays(DateTime.friday)[-2];

      expect(secondToLastFriday, isNotNull);
      expect(secondToLastFriday?.day, equals(18));
    });

    test('third to last Friday of June 2021', () {
      final DateTime june = DateTime(2021, 06);
      final DateTime? thirdToLastFriday = june.weekdays(DateTime.friday)[-3];

      expect(thirdToLastFriday, isNotNull);
      expect(thirdToLastFriday?.day, equals(11));
    });

    test('fourth to last Friday of June 2021', () {
      final DateTime june = DateTime(2021, 06);
      final DateTime? fourthToLastFriday = june.weekdays(DateTime.friday)[-4];

      expect(fourthToLastFriday, isNotNull);
      expect(fourthToLastFriday?.day, equals(4));
    });

    test('no fifth to last Friday in June 2021', () {
      final DateTime june = DateTime(2021, 06);

      expect(() => june.weekdays(DateTime.friday)[-5], throwsRangeError);
    });
  });

  group('monthsBetween()', () {
    test('same month returns 0', () {
      final DateTime dateOne = DateTime(2021, 06);
      final DateTime dateTwo = DateTime(2021, 06, 02);

      final int difference = dateOne.monthsBetween(dateTwo);

      expect(difference, equals(0));
    });

    test('year and a half later returns 18', () {
      final DateTime dateOne = DateTime(2020, 01);
      final DateTime dateTwo = DateTime(2021, 07);

      final int difference = dateOne.monthsBetween(dateTwo);

      expect(difference, equals(18));
    });

    test('same month, one year later, returns 12', () {
      final DateTime dateOne = DateTime(2021, 06);
      final DateTime dateTwo = DateTime(2022, 06);

      final int difference = dateOne.monthsBetween(dateTwo);

      expect(difference, equals(12));
    });
  });
}
