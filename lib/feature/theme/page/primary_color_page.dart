import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/app_scaffold.dart';
import '../service/primary.dart';
import '../service/primary_color.dart';

class PrimaryColorPage extends ConsumerWidget {
  const PrimaryColorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(primaryProvider.select(
      (Primary primary) => primary.color,
    ));
    return AppScaffold(
      title: Text(toString()),
      body: ListView.separated(
        itemBuilder: (_, int index) => RadioListTile<PrimaryColor>(
          value: PrimaryColor.values[index],
          groupValue: current,
          onChanged: (PrimaryColor? primaryColor) => ref
              .read(primaryProvider)
              .selectPrimaryColor(primaryColor ?? current),
          title: Text(describeEnum(PrimaryColor.values[index])),
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: PrimaryColor.values.length,
      ),
    );
  }
}
