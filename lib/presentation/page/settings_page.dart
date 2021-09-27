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
        child: Row(
          children: Primary.values
              .map(
                (Primary primary) => Ink(
                  decoration: ShapeDecoration(
                    color: primary.color,
                    shape: const CircleBorder(),
                  ),
                  child: IconButton(
                    onPressed: () =>
                        ref.read(primaryProvider.notifier).select(primary),
                    icon: Icon(
                      Icons.check,
                      color: primary == currentPrimary
                          ? Colors.white
                          : Colors.transparent,
                    ),
                    color: primary.color,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
