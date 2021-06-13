part of '../recurrence.dart';

/// A recurrence rule that occurs every _n_ years after
/// the beginning [DateTime].
class IntervalYear extends Recurrence {
  /// Create an [IntervalYear] instance.
  ///
  /// Throws an [ArgumentError] if [interval] is less than one.
  IntervalYear(int interval, DateTime startsOn)
      : super([interval], startsOn, RecurrenceType.IntervalYear) {
    if (interval < 1) {
      throw ArgumentError.value(interval, 'Must be one or greater.');
    }
  }

  /// Gets the interval on which this rule occurs.
  int get interval => _values.first;

  @override
  bool occursOn(DateTime date) {
    if (!super.occursOn(date)) {
      return false;
    }

    if (_startsOn.year == date.year) {
      return true;
    }

    final int difference = date.year - _startsOn.year;

    return difference % interval == 0;
  }
}
