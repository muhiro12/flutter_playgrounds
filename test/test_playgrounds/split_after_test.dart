import 'package:flutter_playgrounds/feature/sample_product/entity/sample_product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'split after',
    () {
      List<SampleProduct> method(int index) {
        const list = [
          SampleProduct(id: 0, name: 'name', isFavorited: false),
          SampleProduct(id: 1, name: 'name', isFavorited: false),
          SampleProduct(id: 2, name: 'name', isFavorited: false),
          SampleProduct(id: 3, name: 'name', isFavorited: false),
          SampleProduct(id: 3, name: 'name', isFavorited: false),
          SampleProduct(id: 4, name: 'name', isFavorited: false),
        ];

        var newState = list;
        final lastIndex =
            newState.lastIndexWhere((element) => element.id == index);
        final first = newState.sublist(0, lastIndex + 1);
        final last = newState.sublist(lastIndex + 1);
        newState =
            first.map((e) => e.copyWith(isFavorited: true)).toList() + last;

        return newState;
      }

      test(
        '0',
        () {
          expect(
            method(-1),
            const [
              SampleProduct(id: 0, name: 'name', isFavorited: false),
              SampleProduct(id: 1, name: 'name', isFavorited: false),
              SampleProduct(id: 2, name: 'name', isFavorited: false),
              SampleProduct(id: 3, name: 'name', isFavorited: false),
              SampleProduct(id: 3, name: 'name', isFavorited: false),
              SampleProduct(id: 4, name: 'name', isFavorited: false),
            ],
          );
        },
      );
      test(
        '1',
        () {
          expect(
            method(0),
            const [
              SampleProduct(id: 0, name: 'name', isFavorited: true),
              SampleProduct(id: 1, name: 'name', isFavorited: false),
              SampleProduct(id: 2, name: 'name', isFavorited: false),
              SampleProduct(id: 3, name: 'name', isFavorited: false),
              SampleProduct(id: 3, name: 'name', isFavorited: false),
              SampleProduct(id: 4, name: 'name', isFavorited: false),
            ],
          );
        },
      );
      test(
        '2',
        () {
          expect(
            method(3),
            const [
              SampleProduct(id: 0, name: 'name', isFavorited: true),
              SampleProduct(id: 1, name: 'name', isFavorited: true),
              SampleProduct(id: 2, name: 'name', isFavorited: true),
              SampleProduct(id: 3, name: 'name', isFavorited: true),
              SampleProduct(id: 3, name: 'name', isFavorited: true),
              SampleProduct(id: 4, name: 'name', isFavorited: false),
            ],
          );
        },
      );
      test(
        '3',
        () {
          expect(
            method(10),
            const [
              SampleProduct(id: 0, name: 'name', isFavorited: false),
              SampleProduct(id: 1, name: 'name', isFavorited: false),
              SampleProduct(id: 2, name: 'name', isFavorited: false),
              SampleProduct(id: 3, name: 'name', isFavorited: false),
              SampleProduct(id: 3, name: 'name', isFavorited: false),
              SampleProduct(id: 4, name: 'name', isFavorited: false),
            ],
          );
        },
      );
    },
  );
}
