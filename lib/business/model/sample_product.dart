import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/entity/sample_product.dart';
import '../../data/entity/sample_product_list_item.dart';
import '../../data/repository/sample_product_repository.dart';

final StateProvider<int?> selectedSampleIdProvider =
    StateProvider<int?>((_) => null);

final FutureProvider<List<SampleProductListItem>>
    allSampleProductListItemsProvider =
    FutureProvider<List<SampleProductListItem>>(
        (FutureProviderRef<List<SampleProductListItem>> ref) =>
            ref.watch(sampleProductRepositoryProvider).allSampleProducts());

final FutureProvider<SampleProduct> sampleProductProvider =
    FutureProvider<SampleProduct>(
  (FutureProviderRef<SampleProduct> ref) {
    final id = ref.watch(selectedSampleIdProvider);
    if (id == null) {
      throw Exception();
    }
    return ref.watch(sampleProductRepositoryProvider).sampleProduct(id);
  },
);
