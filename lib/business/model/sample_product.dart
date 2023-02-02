import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/entity/sample_product.dart';
import '../../data/repository/sample_product_repository.dart';

final selectedSampleIdProvider = StateProvider<int?>((_) => null);

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

class SampleProductNotifier extends StateNotifier<SampleProduct> {
  SampleProductNotifier(SampleProduct state) : super(state);

  void toggleFavorite() {
    state = state.copyWith(isFavorited: !state.isFavorited);
  }
}
