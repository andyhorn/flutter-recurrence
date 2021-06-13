part of 'recurrence.dart';

class IntervalMonth extends Recurrence {
  IntervalMonth(int interval, DateTime startsOn)
      : super([interval], startsOn, RecurrenceType.IntervalMonth);

  int get interval => _values.first;
  int get startingMonth => _startsOn.month;
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
