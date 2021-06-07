extension DateTimeExtension on DateTime {
  /// Retrieve the number of days in the current [DateTime]'s month.
  int get daysInMonth {
    DateTime temp = DateTime(year, month + 1, 1);
    temp = temp.subtract(Duration(days: 1));

    return temp.day;
  }

  /// Determines if the current [DateTime] on the same Year/Month/Day
  /// as [other]; ignores the time of day.
  bool isSameDayAs(DateTime other) {
    return other.year == year && other.month == month && other.day == day;
  }

  /// Retrieve an instance of the _nth_ ([occurrence]) [weekday] of the
  /// current [DateTime]'s month, if it exists; otherwise, null.
  DateTime? getNthWeekday(int occurrence, int weekday) {
    DateTime temp = DateTime(year, month, 1);
    int count = 0;

    while (temp.month == month) {
      if (temp.weekday == weekday) {
        count++;
        temp = temp.add(Duration(days: 7));
      } else {
        temp = temp.add(Duration(days: 1));
      }

      if (count == occurrence) {
        break;
      }
    }

    if (count == occurrence) {
      return temp;
    }

    return null;
  }

  /// Gets the total number of months to get from [other] to the current
  /// [DateTime].
  ///
  /// Ex: DateTime(2021, 06).differenceInMonths(DateTime(2020, 10)) = 8
  /// Ex: DateTime(2020, 10).differenceInMonths(DateTime(2021, 06)) = -8
  int differenceInMonths(DateTime other) {
    final int monthDiff = month - other.month;
    final int yearDiff = year - other.year;

    int difference = 12 * yearDiff + monthDiff;

    if (yearDiff > 1 || yearDiff < -1) {
      difference = yearDiff > 1 ? difference + 12 : difference - 12;
    }

    return difference;
  }
}
