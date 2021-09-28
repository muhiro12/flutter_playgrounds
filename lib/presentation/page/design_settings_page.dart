import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/business/model/primary.dart';
import 'package:flutter_playgrounds/presentation/model/design_settings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DesignSettingsPage extends ConsumerWidget {
  const DesignSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DesignSettings currentDesignSettings =
        ref.watch(primaryProvider.select(
      (Primary primary) => primary.designSettings,
    ));
    return Scaffold(
      appBar: AppBar(
        title: Text(toString()),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (_, int index) => RadioListTile<DesignSettings>(
            value: DesignSettings.values[index],
            groupValue: currentDesignSettings,
            onChanged: (DesignSettings? designSettings) => ref
                .read(primaryProvider)
                .selectDesignSettings(designSettings ?? currentDesignSettings),
            title: Text(describeEnum(DesignSettings.values[index])),
          ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: DesignSettings.values.length,
        ),
      ),
    );
  }
}
