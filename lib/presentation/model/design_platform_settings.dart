import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/presentation/model/design_platform.dart';

enum DesignPlatformSettings {
  system,
  material,
  cupertino,
}

extension DesignPlatformSettingsExtension on DesignPlatformSettings {
  DesignPlatform platform(BuildContext context) {
    switch (this) {
      case DesignPlatformSettings.system:
        final TargetPlatform platform = Theme.of(context).platform;
        switch (platform) {
          case TargetPlatform.android:
          case TargetPlatform.fuchsia:
          case TargetPlatform.linux:
          case TargetPlatform.windows:
            return DesignPlatform.material;
          case TargetPlatform.iOS:
          case TargetPlatform.macOS:
            return DesignPlatform.cupertino;
        }
      case DesignPlatformSettings.material:
        return DesignPlatform.material;
      case DesignPlatformSettings.cupertino:
        return DesignPlatform.cupertino;
    }
  }
}
