import 'package:english_words/english_words.dart';

import '../../entity/sample_product.dart';
import '../../entity/sample_product_list_item.dart';
import '../../model/api_client.dart';
import '../sample_product_repository.dart';

class FakeSampleProductRepository extends SampleProductRepository {
  FakeSampleProductRepository(super.ref);

  final _sampleProductList = nouns
      .take(50)
      .toList()
      .asMap()
      .entries
      .map(
        (e) => SampleProduct(id: e.key, name: e.value, isFavorited: false),
      )
      .toList();

  late final client = ref.read(apiClientProvider);

  @override
  Future<List<SampleProductListItem>> allSampleProducts() async {
    return client.call(
      defaultValue: _sampleProductList
          .map(
            (e) => SampleProductListItem(
              id: e.id,
              name: e.name,
              isFavorited: e.isFavorited,
            ),
          )
          .toList(),
    );
  }

  @override
  Future<List<SampleProductListItem>> prefixSampleProducts(Pattern pattern) {
    return client.call(
      defaultValue: _sampleProductList
          .where((element) => element.name.startsWith(pattern))
          .map(
            (e) => SampleProductListItem(
                id: e.id, name: e.name, isFavorited: e.isFavorited),
          )
          .toList(),
    );
  }

  @override
  Future<SampleProduct> sampleProduct(int id) async {
    return client.call(defaultValue: _sampleProductList[id]);
  }

  @override
  Future<void> updateSampleProductListItem(
      SampleProductListItem listItem) async {
    await client.call(defaultValue: () {});
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
    await client.call(defaultValue: () {});
    final index =
        _sampleProductList.indexWhere((element) => element.id == product.id);
    _sampleProductList[index] = product;
  }
}
