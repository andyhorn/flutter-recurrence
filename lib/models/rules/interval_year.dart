part of '../recurrence.dart';

/// A recurrence rule that occurs every _n_ years after
/// the beginning [DateTime].
class IntervalYear extends Recurrence {
  IntervalYear(int interval, DateTime startsOn)
      : super([interval], startsOn, RecurrenceType.IntervalYear);

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
