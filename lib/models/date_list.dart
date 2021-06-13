import 'dart:collection';

/// A list of [DateTime] objects with negative indexing support.
class DateList extends ListBase<DateTime> {
  final List<DateTime> _list = [];

  /// Gets the number of [DateTime] objects in the current collection.
  ///
  /// Throws a [RangeError] if the collection is empty.
  int get length => _list.length;

  /// Sets the length of the collection.
  ///
  /// If [length] is shorter than the current length, items after [length] index
  /// will be lost. If [length] is longer than the current length, items will be
  /// initialized to DateTime(0).
  set length(int length) {
    if (length < 0) {
      throw ArgumentError.value(length, 'Must be greater than zero.');
    }

    if (length < _list.length) {
      _list.length = length;
    } else {
      for (var i = 0; i < _list.length - length; i++) {
        _list.add(DateTime(0));
      }
    }
  }

  /// Retrieves the first [DateTime] object in the collection.
  ///
  /// Throws a [RangeError] if the collection is empty.
  DateTime get first => _list.first;

  /// Retrieves the last [DateTime] object in the collection.
  ///
  /// Throws a [RangeError] if the collection is empty.
  DateTime get last => _list.last;

  /// Adds [date] to the end of the collection.
  void add(DateTime date) => _list.add(date);

  /// Appends the [DateTime] object to the end of the collection.
  void addAll(Iterable<DateTime> dates) => _list.addAll(dates);

  /// Retrieves the [DateTime] object located at [index].
  ///
  /// Supports negative indexing. Ex: DateList[-2] retrieves the second to last
  /// [DateTime] object in the collection.
  ///
  /// [index] must be within range (including negative indices); out of range
  /// values will throw a [RangeError].
  DateTime operator [](int index) {
    if (index < 0) {
      index = _list.length + index;
    }

    if (index < 0 || index >= _list.length) {
      throw RangeError.index(index, _list);
    }

    return _list.elementAt(index);
  }

  /// Sets the [index] of the collection to [date].
  ///
  /// Supports negative indexing. Ex: DateList[-2] = [date] will set the
  /// second to last index to [date].
  ///
  /// [index] must be within rage (including negative indices); out of range
  /// values will throw a [RangeError].
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

  /// Sorts the collection in chronological order.
  void sortAscending() {
    _list.sort((a, b) => a.microsecondsSinceEpoch - b.microsecondsSinceEpoch);
  }

  /// Sorts the collection in reverse chronological order.
  void sortDescending() {
    _list.sort((a, b) => b.microsecondsSinceEpoch - a.microsecondsSinceEpoch);
  }
}
