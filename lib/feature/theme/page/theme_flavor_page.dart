import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app/widget/app_scaffold.dart';
import '../service/primary.dart';
import '../service/theme_flavor.dart';

class ThemeFlavorPage extends ConsumerWidget {
  const ThemeFlavorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(primaryProvider.select(
      (Primary primary) => primary.themeFlavor,
    ));
    return AppScaffold(
      title: Text(toString()),
      body: ListView.separated(
        itemBuilder: (_, int index) => RadioListTile<ThemeFlavor>(
          value: ThemeFlavor.values[index],
          groupValue: current,
          onChanged: (ThemeFlavor? themeFlavor) => ref
              .read(primaryProvider)
              .selectThemeFlavor(themeFlavor ?? current),
          title: Text(describeEnum(ThemeFlavor.values[index])),
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: ThemeFlavor.values.length,
      ),
    );
  }
}
