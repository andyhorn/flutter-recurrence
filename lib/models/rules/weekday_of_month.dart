part of '../recurrence.dart';

/// A recurrence rule that occurs on the specified weekday of a month.
///
/// Ex: The third Thursday.
class WeekdayOfMonth extends Recurrence {
  /// Create a new WeekdayOfMonth instance.
  ///
  /// Throws an [ArgumentError] if [weekOfMonth] is less than one.
  WeekdayOfMonth(int weekOfMonth, DateTime startsOn)
      : super([weekOfMonth], startsOn, RecurrenceType.WeekdayOfMonth) {
    if (weekOfMonth < 1) {
      throw ArgumentError.value(
          weekOfMonth, 'weekOfMonth', 'Cannot be less than one');
    }
  }

  /// Gets the week of the month on which this rule occurs.
  int get weekOfMonth => _values.first;

  /// Gets the weekday on which this rule occurs.
  int get weekday => _startsOn.weekday;

  @override
  bool occursOn(DateTime date) {
    if (!super.occursOn(date)) {
      return false;
    }

    final DateTime? nthWeekday = date.weekdays(weekday)[weekOfMonth - 1];

    if (nthWeekday == null) {
      return false;
    }

    return nthWeekday.isSameDayAs(date);
  }
}
