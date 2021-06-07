library recurrence;

import 'package:recurrence/recurrence_type.dart';
import 'package:recurrence/datetime_extensions.dart';

part 'interval_date.dart';
part 'day_of_month.dart';
part 'day_of_week.dart';
part 'weekday_of_month.dart';
part 'interval_month.dart';
part 'month_of_year.dart';
part 'interval_year.dart';

/// A Recurrence rule.
abstract class Recurrence {
  final List<int> _values;
  final RecurrenceType _type;
  final DateTime _startsOn;

  Recurrence(this._values, this._startsOn, this._type);

  bool occursOn(DateTime date) {
    if (date.isBefore(_startsOn)) {
      return false;
    }

    return true;
  }
}
