part of '../recurrence.dart';

/// A recurrence rule that occurs on a specific day of the week.
class DayOfWeek extends Recurrence {
  /// Create a [DayOfWeek] instance.
  ///
  /// Throws an [ArgumentError] if [weekdays] is null, empty, or
  /// contains values outside the inclusive range 1 (Monday) - 7 (Sunday),
  /// or if [startsOn] is null.
  DayOfWeek(List<int> weekdays, DateTime startsOn)
      : super(weekdays, startsOn, RecurrenceType.DayOfWeek) {
    if (weekdays == null) {
      throw ArgumentError.notNull('weekdays');
    }

    if (weekdays.isEmpty) {
      throw ArgumentError.value(weekdays, 'weekdays', 'Cannot be empty');
    }

    if (weekdays.any((d) => d < DateTime.monday || d > DateTime.sunday)) {
      final int value = weekdays
          .firstWhere((d) => d < DateTime.monday || d > DateTime.sunday);
      throw ArgumentError.value(value, 'weekdays', 'Outside of valid range');
    }

    if (startsOn == null) {
      throw ArgumentError.notNull('startsOn');
    }
  }

  List<int> get weekdays => _values;

  @override
  bool occursOn(DateTime date) {
    if (!super.occursOn(date)) {
      return false;
    }

    return weekdays.contains(date.weekday);
  }
}
