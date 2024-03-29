import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entity/sample_product_list_item.dart';
import 'sample_product_repository.dart';

final sampleProductListProviders = Provider(
  (_) => [
    allSampleProductListProvider,
    favoriteSampleProductListProvider,
    prefixSampleProductListProvider,
  ],
);

final allSampleProductListProvider = StateNotifierProvider.autoDispose<
    SampleProductListNotifier, List<SampleProductListItem>>(
  (ref) => DefaultSampleProductListNotifier(
    ref.watch(sampleProductRepositoryProvider),
    ref,
  ),
);

final favoriteSampleProductListProvider = StateNotifierProvider.autoDispose<
    SampleProductListNotifier, List<SampleProductListItem>>(
  (ref) => FavoriteSampleProductListNotifier(
    ref
        .watch(allSampleProductListProvider)
        .where((product) => product.isFavorited)
        .toList(),
    ref,
  ),
);

final prefixSampleProductListProvider = StateNotifierProvider.autoDispose<
    SampleProductListNotifier, List<SampleProductListItem>>(
  (ref) => PrefixSampleProductListNotifier(
    ref.watch(sampleProductRepositoryProvider),
    ref,
  ),
);

abstract class SampleProductListNotifier
    extends StateNotifier<List<SampleProductListItem>> {
  SampleProductListNotifier(List<SampleProductListItem> state, this.ref)
      : super(state);

  Ref ref;

  void update(SampleProductListItem product) {
    final list = state;
    final index = list.indexWhere((element) => element.id == product.id);
    list[index] = product;
    state = List.from(list);
    ref
        .read(sampleProductRepositoryProvider)
        .updateSampleProductListItem(product);
  }

  void toggleFavorite(int index) {
    final product = state[index];
    update(product.copyWith(isFavorited: !product.isFavorited));
  }
}

class DefaultSampleProductListNotifier extends SampleProductListNotifier {
  DefaultSampleProductListNotifier(this.repository, Ref ref) : super([], ref) {
    repository.allSampleProducts().then((value) => state = value);
  }

  SampleProductRepository repository;
}

class FavoriteSampleProductListNotifier extends SampleProductListNotifier {
  FavoriteSampleProductListNotifier(
      List<SampleProductListItem> state, Ref<Object?> ref)
      : super(state, ref);
}

class PrefixSampleProductListNotifier extends SampleProductListNotifier {
  PrefixSampleProductListNotifier(this.repository, Ref ref) : super([], ref) {
    repository.prefixSampleProducts('s').then((value) => state = value);
  }

  SampleProductRepository repository;
}
