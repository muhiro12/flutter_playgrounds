// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_playgrounds/app.dart';
import 'package:flutter_playgrounds/business/model/git_hub.dart';
import 'package:flutter_playgrounds/data/repository/git_hub_repository.dart';

void main() {
  runApp(
    const ProviderScope(
      overrides: <Override>[],
      child: App(),
    ),
  );
}
