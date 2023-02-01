import '../entity/sample_product.dart';
import '../entity/sample_product_list_item.dart';

abstract class SampleProductRepository {
  Future<List<SampleProductListItem>> allSampleProducts();
  Future<SampleProduct> sampleProduct(int id);
}

class SampleProductRepositoryImplements extends SampleProductRepository {
  @override
  Future<List<SampleProductListItem>> allSampleProducts() {
    // TODO: implement allSampleProducts
    throw UnimplementedError();
  }

  @override
  Future<SampleProduct> sampleProduct(int id) {
    // TODO: implement sampleProduct
    throw UnimplementedError();
  }
}
