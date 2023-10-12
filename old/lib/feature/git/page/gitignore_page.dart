import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/app_scaffold.dart';
import '../entity/gitignore.dart';
import '../service/git_hub.dart';

class GitignorePage extends ConsumerWidget {
  const GitignorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gitignoreName = ModalRoute.of(context)?.settings.arguments as String?;
    return AppScaffold(
      title: Text(toString()),
      body: Builder(
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
                error: (Object error, _) => Text(
                  error.toString(),
                ),
              );
        },
      ),
    );
  }
}
