// Flutter imports:
import 'package:flutter/material.dart';

class LongListPage extends StatelessWidget {
  const LongListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(toString()),
      ),
      body: SafeArea(
        bottom: false,
        child: ListView.separated(
          itemBuilder: (_, int index) => ListTile(
            title: Text(index.toString()),
          ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: 100,
        ),
      ),
    );
  }
}
