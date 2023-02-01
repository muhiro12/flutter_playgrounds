import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/entity/sample_product.dart';
import '../../data/entity/sample_product_list_item.dart';
import '../../data/repository/sample_product_repository.dart';

final FutureProvider<List<SampleProductListItem>>
    allSampleProductListItemsProvider =
    FutureProvider<List<SampleProductListItem>>(
        (FutureProviderRef<List<SampleProductListItem>> ref) =>
            ref.watch(sampleProductRepositoryProvider).allSampleProducts());

final FutureProviderFamily<SampleProduct, int> sampleProductProvider =
    FutureProvider.family((FutureProviderRef<SampleProduct> ref, int id) =>
        ref.watch(sampleProductRepositoryProvider).sampleProduct(id));
