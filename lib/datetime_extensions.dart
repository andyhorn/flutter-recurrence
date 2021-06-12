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
  ///
  /// Supports negative indexing. Ex: -1 for 'last' of the month.
  DateTime? getNthWeekday(int occurrence, int weekday) {
    final List<DateTime> weekdays = this._getWeekdays(weekday);
    int index =
        occurrence < 0 ? weekdays.length - 1 + occurrence : occurrence - 1;

    if (index < 0 || index >= weekdays.length) {
      return null;
    }

    return weekdays[index];
  }

  List<DateTime> _getWeekdays(int weekday) {
    final List<DateTime> weekdays = [];

    DateTime date = this._getFirstWeekday(weekday);

    while (date.month == month) {
      weekdays.add(date);
      date = date.add(Duration(days: 7));
    }

    return weekdays;
  }

  DateTime _getFirstWeekday(int weekday) {
    DateTime date = DateTime(year, month, 1);

    if (date.weekday == weekday) {
      return date;
    }

    int diff = date.weekday - weekday;

    if (diff < 0) {
      diff = 7 + diff - 1;
    }

    date = date.add(Duration(days: diff));

    return date;
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
