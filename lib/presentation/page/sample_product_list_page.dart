import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../business/model/sample_product.dart';
import '../../business/model/sample_product_list.dart';
import '../model/app_route.dart';
import '../widget/app_scaffold.dart';

class SampleProductListPage extends ConsumerWidget {
  const SampleProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(allSampleProductListItemsProvider);
    final notifier = ref.watch(allSampleProductListItemsProvider.notifier);
    return AppScaffold(
      title: Text(toString()),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          final product = state[index];
          return ListTile(
            title: Text(product.name),
            trailing: IconButton(
              onPressed: () => notifier.toggleFavorite(index),
              icon: Icon(
                product.isFavorited ? Icons.favorite : Icons.favorite_outline,
                color: Theme.of(context).primaryColor,
              ),
            ),
            onTap: () {
              ref.read(selectedSampleIdProvider.notifier).state = product.id;
              Navigator.of(context).pushNamed(AppRoute.sampleProduct.name);
            },
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: state.length,
      ),
    );
  }
}
