import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/business/model/primary.dart';
import 'package:flutter_playgrounds/presentation/model/primary_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Primary currentPrimary = ref.watch(primaryProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(toString()),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            const ListTile(
              title: Text('ThemeMode'),
            ),
            ...ThemeMode.values
                .map(
                  (ThemeMode themeMode) => RadioListTile<ThemeMode>(
                    value: themeMode,
                    groupValue: currentPrimary.themeMode,
                    onChanged: (ThemeMode? value) => currentPrimary
                        .selectThemeMode(value ?? currentPrimary.themeMode),
                    title: Text(themeMode.toString()),
                  ),
                )
                .toList(),
            const Divider(),
            const ListTile(
              title: Text('Color'),
            ),
            ...PrimaryColor.values
                .map(
                  (PrimaryColor primaryColor) => RadioListTile<PrimaryColor>(
                    value: primaryColor,
                    groupValue: currentPrimary.color,
                    onChanged: (PrimaryColor? value) => currentPrimary
                        .selectPrimaryColor(value ?? currentPrimary.color),
                    title: Text(primaryColor.toString()),
                  ),
                )
                .toList(),
            const Divider(),
            const AboutListTile(),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
