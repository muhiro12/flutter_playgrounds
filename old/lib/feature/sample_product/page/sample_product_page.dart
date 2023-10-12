import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/app_scaffold.dart';
import '../service/sample_product.dart';

class SampleProductPage extends ConsumerWidget {
  const SampleProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      title: Text(toString()),
      body: ref.watch(sampleProductProvider).maybeWhen(
            data: (initialData) {
              final state = ref.watch(sampleProductFamily(initialData));
              final notifier =
                  ref.watch(sampleProductFamily(initialData).notifier);
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.name),
                    IconButton(
                      onPressed: () => notifier.toggleFavorite(),
                      icon: Icon(
                        state.isFavorited
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              );
            },
            orElse: () => const SizedBox(),
          ),
    );
  }
}
