/// Store an ordered, immutable collection of distinct [DateTime]
/// objects with support for negative indexing.
class DateCollection {
  final List<DateTime> _dates = [];

  bool get isEmpty => _dates.isEmpty;
  bool get isNotEmpty => _dates.isNotEmpty;

  DateTime? get first {
    return _dates.isNotEmpty ? _dates.first : null;
  }

  DateTime? get last {
    return _dates.isNotEmpty ? _dates.last : null;
  }

  DateTime? operator [](int index) {
    if (index < 0) {
      index = _dates.length + index;
    }

    if (index < 0) {
      return null;
    }

    return _dates.length > index ? _dates[index] : null;
  }

  DateCollection(List<DateTime> days) {
    for (final DateTime date in days) {
      if (_dates.contains(date)) {
        continue;
      }

      _dates.add(date);
    }

    _dates.sort((a, b) => a.millisecondsSinceEpoch - b.millisecondsSinceEpoch);
  }
}
