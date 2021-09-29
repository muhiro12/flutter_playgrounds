import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/business/model/primary.dart';
import 'package:flutter_playgrounds/presentation/widget/app_scaffold.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeModePage extends ConsumerWidget {
  const ThemeModePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode current = ref.watch(primaryProvider.select(
      (Primary primary) => primary.themeMode,
    ));
    return AppScaffold(
      title: Text(toString()),
      body: ListView.separated(
        itemBuilder: (_, int index) => RadioListTile<ThemeMode>(
          value: ThemeMode.values[index],
          groupValue: current,
          onChanged: (ThemeMode? themeMode) =>
              ref.read(primaryProvider).selectThemeMode(themeMode ?? current),
          title: Text(describeEnum(ThemeMode.values[index])),
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: ThemeMode.values.length,
      ),
    );
  }
}
