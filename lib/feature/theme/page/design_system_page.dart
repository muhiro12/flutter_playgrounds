import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/app_scaffold.dart';
import '../service/design_system.dart';
import '../service/primary.dart';

class DesignSystemPage extends ConsumerWidget {
  const DesignSystemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(primaryProvider.select(
      (Primary primary) => primary.designSystem,
    ));
    return AppScaffold(
      title: Text(toString()),
      body: ListView.separated(
        itemBuilder: (_, int index) => RadioListTile<DesignSystem>(
          value: DesignSystem.values[index],
          groupValue: current,
          onChanged: (DesignSystem? designSystem) => ref
              .read(primaryProvider)
              .selectDesignSystem(designSystem ?? current),
          title: Text(describeEnum(DesignSystem.values[index])),
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: DesignSystem.values.length,
      ),
    );
  }
}
