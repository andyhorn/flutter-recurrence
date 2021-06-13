part of '../recurrence.dart';

/// A recurrence rule that occurs every _n_ days.
class IntervalDate extends Recurrence {
  /// Create an [IntervalDate] instance.
  ///
  /// Throws an [ArgumentError] if [interval] is less than 1.
  IntervalDate(int interval, DateTime startsOn)
      : super([interval], startsOn, RecurrenceType.IntervalDate) {
    if (interval < 1) {
      throw ArgumentError.value(interval, 'interval', 'Cannot be less than 1');
    }
  }

  /// Gets the daily [interval] on which this rule occurs.
  int get interval => _values.first;

  @override
  bool occursOn(DateTime date) {
    if (!super.occursOn(date)) {
      return false;
    }

    final int difference = date.difference(_startsOn).inDays;
    return difference % interval == 0;
  }
}
