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
        child: Column(
          children: <Widget>[
            const Text('ThemeMode'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Ink(
                  decoration: ShapeDecoration(
                    color: Colors.grey.shade600,
                    shape: const CircleBorder(),
                  ),
                  child: IconButton(
                    onPressed: () => ref
                        .read(primaryProvider.notifier)
                        .selectThemeMode(ThemeMode.system),
                    icon: const Icon(Icons.check),
                    color: currentPrimary.themeMode == ThemeMode.system
                        ? Colors.white
                        : Colors.transparent,
                  ),
                ),
                Ink(
                  decoration: ShapeDecoration(
                    color: Colors.grey.shade400,
                    shape: const CircleBorder(),
                  ),
                  child: IconButton(
                    onPressed: () => ref
                        .read(primaryProvider.notifier)
                        .selectThemeMode(ThemeMode.light),
                    icon: const Icon(Icons.check),
                    color: currentPrimary.themeMode == ThemeMode.light
                        ? Colors.white
                        : Colors.transparent,
                  ),
                ),
                Ink(
                  decoration: ShapeDecoration(
                    color: Colors.grey.shade800,
                    shape: const CircleBorder(),
                  ),
                  child: IconButton(
                    onPressed: () => ref
                        .read(primaryProvider.notifier)
                        .selectThemeMode(ThemeMode.dark),
                    icon: const Icon(Icons.check),
                    color: currentPrimary.themeMode == ThemeMode.dark
                        ? Colors.white
                        : Colors.transparent,
                  ),
                ),
              ],
            ),
            const Text('Color'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: PrimaryColor.values
                  .map(
                    (PrimaryColor primaryColor) => Ink(
                      decoration: ShapeDecoration(
                        color: primaryColor.value,
                        shape: const CircleBorder(),
                      ),
                      child: IconButton(
                        onPressed: () => ref
                            .read(primaryProvider.notifier)
                            .selectPrimaryColor(primaryColor),
                        icon: const Icon(Icons.check),
                        color: primaryColor == currentPrimary.color
                            ? Colors.white
                            : Colors.transparent,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
