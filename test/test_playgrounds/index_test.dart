import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'index',
    () {
      final list = [1, 2, 3, 4, 5];

      test(
        '0',
        () {
          expect(
            list[0],
            1,
          );
        },
      );
      test(
        '1',
        () {
          expect(
            () => list[5],
            throwsRangeError,
          );
        },
      );
      test(
        '2',
        () {
          expect(
            list.firstWhereIndexedOrNull((index, element) => index == 0),
            1,
          );
        },
      );
      test(
        '3',
        () {
          expect(
            list.firstWhereIndexedOrNull((index, element) => index == 5),
            null,
          );
        },
      );
    },
  );
}
