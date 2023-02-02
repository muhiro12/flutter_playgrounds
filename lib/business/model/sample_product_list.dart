import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/entity/sample_product_list_item.dart';
import '../../data/repository/sample_product_repository.dart';

final allSampleProductListItemsProvider = StateNotifierProvider<
        SampleProductListNotifier, List<SampleProductListItem>>(
    (ref) => DefaultSampleProductListNotifier(
        ref.watch(sampleProductRepositoryProvider)));

abstract class SampleProductListNotifier
    extends StateNotifier<List<SampleProductListItem>> {
  SampleProductListNotifier(List<SampleProductListItem> state) : super(state);

  void toggleFavorite(int index) {
    final list = state;
    final current = list[index];
    list[index] = current.copyWith(isFavorited: !current.isFavorited);
    state = List.from(list);
  }
}

class DefaultSampleProductListNotifier extends SampleProductListNotifier {
  DefaultSampleProductListNotifier(this.repository) : super([]) {
    repository.allSampleProducts().then((value) => state = value);
  }

  SampleProductRepository repository;
}
