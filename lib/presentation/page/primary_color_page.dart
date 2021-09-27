import 'package:flutter/material.dart';
import 'package:flutter_playgrounds/business/model/primary.dart';
import 'package:flutter_playgrounds/presentation/model/primary_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PrimaryColorPage extends ConsumerWidget {
  const PrimaryColorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PrimaryColor currentPrimaryColor = ref.watch(primaryProvider.select(
      (Primary primary) => primary.color,
    ));
    return Scaffold(
      appBar: AppBar(
        title: Text(toString()),
      ),
      body: SafeArea(
        child: ListView(
          children: PrimaryColor.values
              .map(
                (PrimaryColor primaryColor) => RadioListTile<PrimaryColor>(
                  value: primaryColor,
                  groupValue: currentPrimaryColor,
                  onChanged: (PrimaryColor? primaryColor) => ref
                      .read(primaryProvider)
                      .selectPrimaryColor(primaryColor ?? currentPrimaryColor),
                  title: Text(primaryColor.toString()),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
