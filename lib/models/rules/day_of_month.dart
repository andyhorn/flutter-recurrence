part of '../recurrence.dart';

/// A recurrence rule that occurs on one or more specific days of the month.
///
/// Supports negative indexing. Ex: -1 for the last day of the month.
class DayOfMonth extends Recurrence {
  /// Create a new [DayOfMonth] instance.
  ///
  /// Supports an empty [days] list to indicate _every_ day of the month.
  DayOfMonth(List<int> days, DateTime startsOn)
      : super(days, startsOn, RecurrenceType.DayOfMonth);

  /// Gets the list of days on which this rule occurs.
  List<int> get daysOfMonth => _values;

  @override
  bool occursOn(DateTime date) {
    if (!super.occursOn(date)) {
      return false;
    }

    final List<int> days = _getAdjustedDates(date);
    return days.contains(date.day);
  }

  List<int> _getAdjustedDates(DateTime date) {
    final int daysInMonth = date.daysInMonth;
    final List<int> tempDays = [];

    for (int i = 0; i < _values.length; i++) {
      int date = _values[i];

      if (date < 0) {
        date = daysInMonth + (date + 1);
      }

      if (tempDays.contains(date)) {
        continue;
      }

      tempDays.add(date);
    }

    return tempDays;
  }
}
