import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/feature/theme/service/design_platform.dart';

enum DesignSystem {
  dynamic,
  material,
  cupertino,
}

extension DesignSystemExtension on DesignSystem {
  DesignPlatform platform(BuildContext context) {
    switch (this) {
      case DesignSystem.dynamic:
        final platform = Theme.of(context).platform;
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
      case DesignSystem.material:
        return DesignPlatform.material;
      case DesignSystem.cupertino:
        return DesignPlatform.cupertino;
    }
  }
}
