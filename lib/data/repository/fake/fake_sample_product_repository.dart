import 'package:english_words/english_words.dart';

import '../../entity/sample_product.dart';
import '../../entity/sample_product_list_item.dart';
import '../sample_product_repository.dart';

class FakeSampleProductRepository extends SampleProductRepository {
  final _sampleProductList = nouns
      .take(50)
      .toList()
      .asMap()
      .entries
      .map(
        (e) => SampleProduct(id: e.key, name: e.value, isFavorited: false),
      )
      .toList();

  @override
  Future<List<SampleProductListItem>> allSampleProducts() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return _sampleProductList
        .map(
          (e) => SampleProductListItem(
            id: e.id,
            name: e.name,
            isFavorited: e.isFavorited,
          ),
        )
        .toList();
  }

  @override
  Future<SampleProduct> sampleProduct(int id) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return _sampleProductList[id];
  }

  @override
  Future<void> updateSampleProductListItem(
      SampleProductListItem listItem) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    final index =
        _sampleProductList.indexWhere((element) => element.id == listItem.id);
    final product = _sampleProductList[index];
    _sampleProductList[index] = product.copyWith(
      name: listItem.name,
      isFavorited: listItem.isFavorited,
    );
  }

  @override
  Future<void> updateSampleProduct(SampleProduct product) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    final index =
        _sampleProductList.indexWhere((element) => element.id == product.id);
    _sampleProductList[index] = product;
  }
}
