import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../business/model/sample_product.dart';
import '../../data/entity/sample_product_list_item.dart';
import '../model/app_route.dart';
import '../widget/app_scaffold.dart';

class SampleProductListPage extends ConsumerWidget {
  const SampleProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<SampleProductListItem>> sampleProductList =
        ref.watch(allSampleProductListItemsProvider);
    return AppScaffold(
      title: Text(toString()),
      body: sampleProductList.maybeWhen(
        data: (List<SampleProductListItem> list) => ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            final SampleProductListItem product = list[index];
            return ListTile(
              title: Text(product.name),
              trailing: IconButton(
                onPressed: () {},
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
          itemCount: list.length,
        ),
        orElse: () => const SizedBox(),
      ),
    );
  }
}
