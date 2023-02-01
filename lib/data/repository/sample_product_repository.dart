import 'package:english_words/english_words.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entity/sample_product.dart';
import '../entity/sample_product_list_item.dart';

final Provider<SampleProductRepository> sampleProductRepositoryProvider =
    Provider<SampleProductRepository>(
        (_) => SampleProductRepositoryImplements());

abstract class SampleProductRepository {
  Future<List<SampleProductListItem>> allSampleProducts();
  Future<SampleProduct> sampleProduct(int id);
}

class SampleProductRepositoryImplements extends SampleProductRepository {
  final List<String> nameList = nouns.take(50).toList();

  @override
  Future<List<SampleProductListItem>> allSampleProducts() async {
    return nameList
        .asMap()
        .entries
        .map(
          (MapEntry<int, String> entry) => SampleProductListItem(
            id: entry.key,
            name: entry.value,
            isFavorited: false,
          ),
        )
        .toList();
  }

  @override
  Future<SampleProduct> sampleProduct(int id) async {
    return SampleProduct(
      id: id,
      name: nameList[id],
      isFavorited: false,
    );
  }
}
