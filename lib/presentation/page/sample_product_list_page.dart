import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/app_route.dart';
import '../widget/app_scaffold.dart';

class SampleProductListPage extends ConsumerWidget {
  const SampleProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      title: Text(toString()),
      body: ListView.separated(
        itemBuilder: (_, int index) => ListTile(
          title: Text(index.toString()),
          onTap: () =>
              Navigator.of(context).pushNamed(AppRoute.sampleProduct.name),
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: 10,
      ),
    );
  }
}
