import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entity/sample_product.dart';
import '../entity/sample_product_list_item.dart';

final Provider<SampleProductRepository> sampleProductRepositoryProvider =
    Provider<SampleProductRepository>(
        (ref) => SampleProductRepositoryImplements(ref));

abstract class SampleProductRepository {
  const SampleProductRepository(this.ref);

  final Ref ref;

  Future<List<SampleProductListItem>> allSampleProducts();
  Future<SampleProduct> sampleProduct(int id);
  Future<void> updateSampleProductListItem(SampleProductListItem listItem);
  Future<void> updateSampleProduct(SampleProduct product);
}

class SampleProductRepositoryImplements extends SampleProductRepository {
  const SampleProductRepositoryImplements(super.ref);

  @override
  Future<List<SampleProductListItem>> allSampleProducts() {
    throw UnimplementedError();
  }

  @override
  Future<SampleProduct> sampleProduct(int id) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateSampleProductListItem(SampleProductListItem listItem) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateSampleProduct(SampleProduct product) {
    throw UnimplementedError();
  }
}
