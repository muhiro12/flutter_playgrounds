import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/entity/sample_product_list_item.dart';
import '../../data/repository/sample_product_repository.dart';

final selectedSampleProductListItemProvider =
    StateProvider<SampleProductListItem?>((_) => null);

final allSampleProductListItemsProvider = StateNotifierProvider<
    SampleProductListNotifier, List<SampleProductListItem>>(
  (ref) => DefaultSampleProductListNotifier(
    ref.watch(sampleProductRepositoryProvider),
    ref,
  ),
);

final favoriteSampleProductListItemsProvider = StateNotifierProvider<
    SampleProductListNotifier, List<SampleProductListItem>>(
  (ref) => FavoriteSampleProductListNotifier(
    ref
        .watch(allSampleProductListItemsProvider)
        .where((product) => product.isFavorited)
        .toList(),
    ref,
  ),
);

abstract class SampleProductListNotifier
    extends StateNotifier<List<SampleProductListItem>> {
  SampleProductListNotifier(List<SampleProductListItem> state, this.ref)
      : super(state) {
    ref.listen<SampleProductListItem?>(
      selectedSampleProductListItemProvider,
      (previous, next) {
        if (next == null || !mounted) {
          return;
        }
        update(next);
      },
    );
  }

  Ref ref;

  void update(SampleProductListItem product) {
    final list = state;
    final index = list.indexWhere((element) => element.id == product.id);
    list[index] = product;
    state = List.from(list);
    ref
        .read(sampleProductRepositoryProvider)
        .updateSampleProductListItem(product);
    ref.read(selectedSampleProductListItemProvider.notifier).state = product;
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
