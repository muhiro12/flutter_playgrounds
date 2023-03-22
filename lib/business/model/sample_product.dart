import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/entity/sample_product.dart';
import '../../data/repository/sample_product_repository.dart';
import 'sample_product_list.dart';

final sampleProductProvider = FutureProvider.autoDispose<SampleProduct>(
  (ref) {
    final id = ref.watch(
      selectedSampleProductListItemProvider.select((product) => product?.id),
    );
    if (id == null) {
      throw Exception();
    }
    return ref.watch(sampleProductRepositoryProvider).sampleProduct(id);
  },
);

final sampleProductFamily = StateNotifierProvider.family<SampleProductNotifier,
    SampleProduct, SampleProduct>(
  (ref, state) => SampleProductNotifier(state, ref),
);

class SampleProductNotifier extends StateNotifier<SampleProduct> {
  SampleProductNotifier(SampleProduct state, this.ref) : super(state);

  Ref ref;

  void update(SampleProduct product) {
    state = product;
    ref.read(sampleProductRepositoryProvider).updateSampleProduct(product);
    ref.read(selectedSampleProductListItemProvider.notifier).update(
          (state) => state?.copyWith(isFavorited: this.state.isFavorited),
        );
  }

  void toggleFavorite() {
    update(state.copyWith(isFavorited: !state.isFavorited));
  }
}
