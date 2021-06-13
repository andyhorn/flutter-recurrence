part of '../recurrence.dart';

/// A recurrence rule that occurs every _n_ months.
class IntervalMonth extends Recurrence {
  /// Create an [IntervalMonth] instance.
  ///
  /// Throws an [ArgumentError] if [interval] is less than one.
  IntervalMonth(int interval, DateTime startsOn)
      : super([interval], startsOn, RecurrenceType.IntervalMonth) {
    if (interval < 1) {
      throw ArgumentError.value(
          interval, 'interval', 'Cannot be less than one.');
    }
  }

  /// Gets the [interval] value.
  int get interval => _values.first;

  /// Gets the month on which this rule begins.
  int get startingMonth => _startsOn.month;

  /// Gets the day of the month on which this rule begins.
  int get day => _startsOn.day;

  @override
  bool occursOn(DateTime date) {
    if (!super.occursOn(date)) {
      return false;
    }

    if (date.day != day) {
      return false;
    }

    final int difference = date.monthsBetween(_startsOn);

    return difference % interval == 0;
  }
}
