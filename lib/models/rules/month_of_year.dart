part of '../recurrence.dart';

/// A recurrence rule that occurs on one or more specific
/// [months] of the year.
class MonthOfYear extends Recurrence {
  MonthOfYear(List<int> months, DateTime startsOn)
      : super(months, startsOn, RecurrenceType.MonthOfYear);

  List<int> get months => _values.toList();

  @override
  bool occursOn(DateTime date) {
    if (!super.occursOn(date)) {
      return false;
    }

    return months.contains(date.month);
  }
}
