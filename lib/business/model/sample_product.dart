import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/entity/sample_product.dart';
import '../../data/entity/sample_product_list_item.dart';
import '../../data/repository/sample_product_repository.dart';

final selectedSampleIdProvider = StateProvider<int?>((_) => null);

final allSampleProductListItemsProvider = StateNotifierProvider<
        SampleProductListNotifier, List<SampleProductListItem>>(
    (ref) =>
        SampleProductListNotifier(ref.watch(sampleProductRepositoryProvider)));

final sampleProductProvider = FutureProvider<SampleProduct>(
  (ref) {
    final id = ref.watch(selectedSampleIdProvider);
    if (id == null) {
      throw Exception();
    }
    return ref.watch(sampleProductRepositoryProvider).sampleProduct(id);
  },
);

final sampleProductFamily = StateNotifierProvider.family<SampleProductNotifier,
    SampleProduct, SampleProduct>((ref, state) => SampleProductNotifier(state));

class SampleProductListNotifier
    extends StateNotifier<List<SampleProductListItem>> {
  SampleProductListNotifier(this.repository) : super([]) {
    repository.allSampleProducts().then((value) => state = value);
  }

  SampleProductRepository repository;

  void toggleFavorite(int index) {
    final list = state;
    final current = list[index];
    list[index] = current.copyWith(isFavorited: !current.isFavorited);
    state = List.from(list);
  }
}

class SampleProductNotifier extends StateNotifier<SampleProduct> {
  SampleProductNotifier(SampleProduct state) : super(state);

  void toggleFavorite() {
    state = state.copyWith(isFavorited: !state.isFavorited);
  }
}
