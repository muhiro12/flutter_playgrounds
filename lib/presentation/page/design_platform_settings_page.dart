import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/business/model/primary.dart';
import 'package:flutter_playgrounds/presentation/model/design_platform_settings.dart';
import 'package:flutter_playgrounds/presentation/widget/platform_scaffold.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DesignPlatformSettingsPage extends ConsumerWidget {
  const DesignPlatformSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DesignPlatformSettings current = ref.watch(primaryProvider.select(
      (Primary primary) => primary.designPlatformSettings,
    ));
    return PlatformScaffold(
      title: Text(toString()),
      body: ListView.separated(
        itemBuilder: (_, int index) => RadioListTile<DesignPlatformSettings>(
          value: DesignPlatformSettings.values[index],
          groupValue: current,
          onChanged: (DesignPlatformSettings? designPlatformSettings) => ref
              .read(primaryProvider)
              .selectDesignPlatformSettings(designPlatformSettings ?? current),
          title: Text(describeEnum(DesignPlatformSettings.values[index])),
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: DesignPlatformSettings.values.length,
      ),
    );
  }
}
