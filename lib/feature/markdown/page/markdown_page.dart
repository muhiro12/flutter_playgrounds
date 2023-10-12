import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../common/app_scaffold.dart';
import '../../../common/file_extension.dart';

class MarkdownPage extends HookWidget {
  const MarkdownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<String> file = useMemoized(
      File('https://raw.githubusercontent.com/muhiro12/muhiro12/main/README.md')
          .readFromNetwork,
    );
    final data = useFuture(file).data ?? '';
    return AppScaffold(
      title: Text(toString()),
      body: Markdown(
        data: data,
      ),
    );
  }
}
