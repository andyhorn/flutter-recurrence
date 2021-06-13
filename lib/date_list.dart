import 'dart:collection';

/// A list of [DateTime] objects.
class DateList extends ListBase<DateTime> {
  final List<DateTime> _list = [];

  int get length => _list.length;
  set length(int length) => _list.length = length;

  DateTime get first => _list.first;
  DateTime get last => _list.last;

  void add(DateTime date) => _list.add(date);
  void addAll(Iterable<DateTime> dates) => _list.addAll(dates);

  DateTime operator [](int index) {
    if (index < 0) {
      index = _list.length + index;
    }

    if (index < 0 || index >= _list.length) {
      throw RangeError.index(index, _list);
    }

    return _list.elementAt(index);
  }

  void operator []=(int index, DateTime date) {
    if (index < 0) {
      index = _list.length + index;
    }

    if (index < 0 || index >= _list.length) {
      throw RangeError.index(index, _list);
    }

    _list[index] = date;
  }

  DateList(Iterable<DateTime> dates) {
    _list.addAll(dates);
  }
}
