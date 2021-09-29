import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/business/model/primary.dart';
import 'package:flutter_playgrounds/presentation/model/primary_color.dart';
import 'package:flutter_playgrounds/presentation/widget/app_scaffold.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PrimaryColorPage extends ConsumerWidget {
  const PrimaryColorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PrimaryColor current = ref.watch(primaryProvider.select(
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
