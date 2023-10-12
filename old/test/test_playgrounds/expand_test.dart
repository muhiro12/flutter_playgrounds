import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'expanded',
    () {
      final list = [1, 2, 3, 4, 5];

      test(
        '0',
        () {
          expect(
            list.expand((element) => [element, 0]).take(list.length * 2 - 1),
            [1, 0, 2, 0, 3, 0, 4, 0, 5],
          );
        },
      );
    },
  );
}
