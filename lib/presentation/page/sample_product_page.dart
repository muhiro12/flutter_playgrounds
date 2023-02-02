import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../business/model/sample_product.dart';
import '../../data/entity/sample_product.dart';
import '../widget/app_scaffold.dart';

class SampleProductPage extends ConsumerWidget {
  const SampleProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sampleProduct =
        ref.watch(sampleProductProvider);
    return AppScaffold(
      title: Text(toString()),
      body: sampleProduct.maybeWhen(
        data: (SampleProduct product) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(product.name),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  product.isFavorited ? Icons.favorite : Icons.favorite_outline,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
        orElse: () => const SizedBox(),
      ),
    );
  }
}
