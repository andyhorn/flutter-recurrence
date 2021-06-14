import 'package:flutter_test/flutter_test.dart';
import 'package:recurrence/models/date_list.dart';

void main() {
  group('date_list:', () {
    test('empty list: length returns 0', () {
      final DateList list = DateList();

      final int length = list.length;

      expect(length, equals(0));
    });

    test('setting length to zero clears all items', () {
      final DateList list = DateList.from([
        DateTime.now(),
        DateTime.now(),
        DateTime.now(),
      ]);

      final int initialLength = list.length;

      list.length = 0;

      final int length = list.length;

      expect(initialLength, equals(3));
      expect(length, equals(0));
    });

    test('setting length longer adds DateTime objects', () {
      final DateList list = DateList();

      list.length = 2;

      expect(list.length, equals(2));
    });

    test('added items are day zero', () {
      final DateList list = DateList();

      list.length = 2;

      for (int i = 0; i < list.length; i++) {
        expect(list[i], equals(DateTime(0)));
      }
    });

    group('bracket operator:', () {
      final List<DateTime> items = [
        DateTime(2021, 06, 12),
        DateTime(2021, 07, 15),
      ];
      final DateList list = DateList.from(items);

      test('index 0 retrieves first item', () {
        expect(list[0], equals(items[0]));
      });

      test('negative index 1 retrieves last item', () {
        expect(list[-1], equals(items.last));
      });

      test('out of range positive index throws RangeError', () {
        expect(() => list[5], throwsRangeError);
      });

      test('out of range negative index throws RangeError', () {
        expect(() => list[-5], throwsRangeError);
      });

      test('setting at index replaces item', () {
        final DateTime newItem = DateTime(2022, 08, 01);

        list[1] = newItem;

        expect(list[1], equals(newItem));
      });

      test('setting out of range throws RangeError', () {
        expect(() => list[3] = DateTime.now(), throwsRangeError);
      });

      test('setting negative out of range throws RangeError', () {
        expect(() => list[-3] = DateTime.now(), throwsRangeError);
      });
    });

    group('sorting:', () {
      final List<DateTime> unsorted = [
        DateTime(2021, 06, 01),
        DateTime(2020, 09, 18),
        DateTime(2022, 02, 03),
      ];
      final List<DateTime> sortedAsc = [
        unsorted[1],
        unsorted[0],
        unsorted[2],
      ];
      final List<DateTime> sortedDesc = [
        unsorted[2],
        unsorted[0],
        unsorted[1],
      ];

      test('sort ascending', () {
        final DateList list = DateList.from(unsorted);

        list.sortAscending();

        for (int i = 0; i < sortedAsc.length; i++) {
          expect(list[i], equals(sortedAsc[i]));
        }
      });

      test('sort descending', () {
        final DateList list = DateList.from(unsorted);

        list.sortDescending();

        for (int i = 0; i < sortedDesc.length; i++) {
          expect(list[i], equals(sortedDesc[i]));
        }
      });
    });
  });
}
