import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../feature/app/widget/app_scaffold.dart';
import '../service/sample_product.dart';
import '../service/sample_product_list.dart';
import 'sample_product_page.dart';

class PrefixSampleProductListPage extends HookConsumerWidget {
  const PrefixSampleProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(prefixSampleProductListProvider);
    final notifier = ref.watch(prefixSampleProductListProvider.notifier);

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
              Navigator.of(context).push<void>(
                MaterialPageRoute(
                  builder: (_) => ProviderScope(
                    overrides: [
                      selectedSampleProductIdProvider
                          .overrideWith((_) => product.id),
                    ],
                    child: const SampleProductPage(),
                  ),
                ),
              );
            },
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: state.length,
      ),
    );
  }
}
