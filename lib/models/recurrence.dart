library recurrence;

import 'package:recurrence/enums/recurrence_type.dart';
import 'package:recurrence/models/date_list.dart';
import 'package:recurrence/utilities/datetime_extensions.dart';

part 'rules/time_of_day.dart';
part 'rules/interval_date.dart';
part 'rules/day_of_month.dart';
part 'rules/day_of_week.dart';
part 'rules/weekday_of_month.dart';
part 'rules/interval_month.dart';
part 'rules/month_of_year.dart';
part 'rules/interval_year.dart';

/// The abstract base [Recurrence] rule.
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
