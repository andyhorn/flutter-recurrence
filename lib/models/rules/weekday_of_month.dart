part of '../recurrence.dart';

/// A recurrence rule that occurs on the specified weekday of a month.
class WeekdayOfMonth extends Recurrence {
  /// Create a new WeekdayOfMonth instance occurring on [startsOn.weekday] on
  /// any of the [weeksOfMonth]. Supports negative indexing.
  ///
  /// For example, the second and last Thursday of the month:
  /// WeekdayOfMonth([2, -1], [DateTime occurring on a Thursday]);
  WeekdayOfMonth(List<int> weeksOfMonth, DateTime startsOn)
      : super(weeksOfMonth, startsOn, RecurrenceType.WeekdayOfMonth);

  /// Gets the weekday on which this rule occurs.
  int get weekday => _startsOn.weekday;

  @override
  bool occursOn(DateTime date) {
    if (!super.occursOn(date) || date.weekday != weekday) {
      return false;
    }

    if (_values.isEmpty) {
      return true;
    }

    final DateList weekdays = date.weekdays(weekday);

    return _values.any((d) => weekdays[d].isSameDayAs(date));
  }
}
