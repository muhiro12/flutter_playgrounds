import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widget/app_scaffold.dart';

class SampleProductPage extends ConsumerWidget {
  const SampleProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      title: Text(toString()),
      body: Center(
        child: Text(toString()),
      ),
    );
  }
}
