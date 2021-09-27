// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_playgrounds/business/model/git_hub.dart';
import 'package:flutter_playgrounds/data/entity/gitignore.dart';

class GitignorePage extends ConsumerWidget {
  const GitignorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? gitignoreName =
        ModalRoute.of(context)?.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(
        title: Text(toString()),
      ),
      body: SafeArea(
        child: Builder(
          builder: (BuildContext context) {
            if (gitignoreName == null) {
              return const Text('Empty');
            }
            return ref.watch(gitignoreProvider(gitignoreName)).when(
                  data: (Gitignore gitignore) => ListView(
                    children: <Widget>[
                      Text(gitignore.name),
                      Text(gitignore.source),
                    ],
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (Object error, __) => Text(
                    error.toString(),
                  ),
                );
          },
        ),
      ),
    );
  }
}
