import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/business/model/primary.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeModePage extends ConsumerWidget {
  const ThemeModePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode currentThemeMode = ref.watch(primaryProvider.select(
      (Primary primary) => primary.themeMode,
    ));
    return Scaffold(
      appBar: AppBar(
        title: Text(toString()),
      ),
      body: SafeArea(
        child: ListView(
          children: ThemeMode.values
              .map(
                (ThemeMode themeMode) => RadioListTile<ThemeMode>(
                  value: themeMode,
                  groupValue: currentThemeMode,
                  onChanged: (ThemeMode? themeMode) => ref
                      .read(primaryProvider)
                      .selectThemeMode(themeMode ?? currentThemeMode),
                  title: Text(themeMode.toString()),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
