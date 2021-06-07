part of 'recurrence.dart';

/// A recurrence rule that occurs every _n_ days.
class IntervalDate extends Recurrence {
  /// Create an [IntervalDate] rule.
  ///
  /// Throws an [ArgumentError] if [interval] is less than 1
  /// or if [startsOn] is null.
  IntervalDate(int interval, DateTime startsOn)
      : super([interval], startsOn, RecurrenceType.IntervalDate) {
    if (interval < 1) {
      throw ArgumentError.value(interval, 'interval', 'Cannot be less than 1');
    }

    if (startsOn == null) {
      throw ArgumentError.notNull('startsOn');
    }
  }

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
