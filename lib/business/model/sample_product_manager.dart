import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/entity/sample_product.dart';
import '../../data/entity/sample_product_list_item.dart';
import 'sample_product_list.dart';

final sampleProductManagerProvider =
    Provider((ref) => SampleProductListManager(ref));

class SampleProductListManager {
  SampleProductListManager(this.ref);

  Ref ref;

  void updateSampleProductListItem(SampleProduct product) {
    ref.read(sampleProductListProviders).forEach(
      (provider) {
        ref.read(provider.notifier).update(
              SampleProductListItem(
                id: product.id,
                name: product.name,
                isFavorited: product.isFavorited,
              ),
            );
      },
    );
  }
}
