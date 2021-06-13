part of '../recurrence.dart';

/// A recurrence rule that occurs on one or more specific days of the week.
class DayOfWeek extends Recurrence {
  /// Create a [DayOfWeek] instance.
  ///
  /// Throws an [ArgumentError] if [weekdays] is empty or contains values
  /// outside the inclusive range: 1 (Monday) - 7 (Sunday).
  DayOfWeek(List<int> weekdays, DateTime startsOn)
      : super(weekdays, startsOn, RecurrenceType.DayOfWeek) {
    if (weekdays.isEmpty) {
      throw ArgumentError.value(weekdays, 'weekdays', 'Cannot be empty');
    }

    if (weekdays.any((d) => d < DateTime.monday || d > DateTime.sunday)) {
      final int value = weekdays
          .firstWhere((d) => d < DateTime.monday || d > DateTime.sunday);
      throw ArgumentError.value(value, 'weekdays', 'Outside of valid range');
    }
  }

  /// Gets the list of weekdays (Monday: 1 - Sunday: 7) on which this
  /// rule occurs.
  List<int> get weekdays => _values;

  @override
  bool occursOn(DateTime date) {
    if (!super.occursOn(date)) {
      return false;
    }

    return weekdays.contains(date.weekday);
  }
}
