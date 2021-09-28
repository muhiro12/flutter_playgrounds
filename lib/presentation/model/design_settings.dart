import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/presentation/model/design_system.dart';

enum DesignSettings {
  auto,
  material,
  cupertino,
}

extension DesignSettingsExtension on DesignSettings {
  DesignSystem designSystem(BuildContext context) {
    switch (this) {
      case DesignSettings.auto:
        final TargetPlatform platform = Theme.of(context).platform;
        switch (platform) {
          case TargetPlatform.android:
          case TargetPlatform.fuchsia:
          case TargetPlatform.linux:
          case TargetPlatform.windows:
            return DesignSystem.material;
          case TargetPlatform.iOS:
          case TargetPlatform.macOS:
            return DesignSystem.cupertino;
        }
      case DesignSettings.material:
        return DesignSystem.material;
      case DesignSettings.cupertino:
        return DesignSystem.cupertino;
    }
  }
}
