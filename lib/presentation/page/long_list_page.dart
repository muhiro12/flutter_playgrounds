import 'package:flutter/material.dart';

class LongListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(toString()),
      ),
      body: SafeArea(
        bottom: false,
        child: ListView.separated(
          itemBuilder: (context, index) => ListTile(
            title: Text(index.toString()),
          ),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 100,
        ),
      ),
    );
  }
}
