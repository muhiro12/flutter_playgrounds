import 'package:flutter/material.dart';

import '../../../common/app_scaffold.dart';
import '../../../common/string_extension.dart';

class FormatPage extends StatelessWidget {
  const FormatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: Text(toString()),
      body: ListView(
        children: [
          _buildTile(
            title: DateTime.now().toString(),
            subtitle: 'DateTime.now().toString()',
          ),
          _buildTile(
            title: DateTime.now().toIso8601String(),
            subtitle: 'DateTime.now().toIso8601String()',
          ),
          _buildTile(
            title: DateTime.now().toUtc().toString(),
            subtitle: 'DateTime.now().toUtc().toString()',
          ),
          _buildTile(
            title: DateTime.now().toUtc().toIso8601String(),
            subtitle: 'DateTime.now().toUtc().toIso8601String()',
          ),
          _buildTile(
            title: '2020/01/01'.toYMD() ?? '',
            subtitle: '2020/01/01.toYMD()',
          ),
          _buildTile(
            title: '2020-01-01'.toYMD() ?? '',
            subtitle: '2020-01-01.toYMD()',
          ),
          _buildTile(
            title: '2020/01/01'.toYYYYMMDD() ?? '',
            subtitle: '2020/01/01.toYYYYMMDD()',
          ),
          _buildTile(
            title: '2020-01-01'.toYYYYMMDD() ?? '',
            subtitle: '2020-01-01.toYYYYMMDD()',
          ),
        ],
      ),
    );
  }

  Widget _buildTile({
    required String title,
    required String subtitle,
  }) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
        ),
        const Divider(),
      ],
    );
  }
}
