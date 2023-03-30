import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/entity/sample_product.dart';
import '../../data/repository/sample_product_repository.dart';
import 'app_exception.dart';
import 'sample_product_manager.dart';

final selectedSampleProductIdProvider = StateProvider<int?>((_) => null);

final sampleProductProvider = FutureProvider.autoDispose<SampleProduct>(
  (ref) {
    final id = ref.watch(selectedSampleProductIdProvider);
    if (id == null) {
      throw AppException.other();
    }
    try {
      return ref.watch(sampleProductRepositoryProvider).sampleProduct(id);
    } on Error catch (error) {
      throw AppException.error(error);
    }
  },
  dependencies: [
    selectedSampleProductIdProvider,
    sampleProductRepositoryProvider,
  ],
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
    ref.read(sampleProductManagerProvider).updateSampleProductListItem(product);
  }

  void toggleFavorite() {
    update(state.copyWith(isFavorited: !state.isFavorited));
  }
}
