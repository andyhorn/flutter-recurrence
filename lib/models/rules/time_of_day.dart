part of '../recurrence.dart';

/// A recurrence rule that occurs at a specific time of day.
///
/// Can be set to increasing measures of similarity. For example: only
/// comparing the hours; comparing hours and minutes; comparing hours, minutes,
/// and seconds; and so on down to microseconds.
class TimeOfDay extends Recurrence {
  /// Create an instance of the [TimeOfDay] rule.
  ///
  /// Specify the 'depth' of comparison needed: 1 for hours-only, 2 for hours
  /// and minutes, 3 for hours, minutes, and seconds, and so on down to
  /// microseconds (5).
  ///
  /// Will throw a [RangeError] if [depth] is less than 1 or greater than 5.
  TimeOfDay(int depth, DateTime tod)
      : super([
          depth,
          tod.hour,
          tod.minute,
          tod.second,
          tod.millisecond,
          tod.microsecond,
        ], tod, RecurrenceType.TimeOfDay) {
    if (depth < 1 || depth > 5) {
      throw RangeError.range(depth, 1, 5);
    }
  }

  @override
  bool occursOn(DateTime date) {
    if (!super.occursOn(date)) {
      return false;
    }

    List<int> timeValues = [
      date.hour,
      date.minute,
      date.second,
      date.millisecond,
      date.microsecond,
    ];

    bool matches = false;

    for (int i = 1; i < _values[0]; i++) {
      matches = timeValues[i - 1] == _values[i];

      if (!matches) {
        break;
      }
    }

    return matches;
  }
}
