import 'package:intl/intl.dart';

extension StringExtension on String {
  String? toYMD() {
    final date = DateTime.tryParse(this);
    if (date == null) {
      return null;
    }
    return DateFormat.yMd().format(date);
  }

  String? toYYYYMMDD() {
    final date = DateTime.tryParse(this);
    if (date == null) {
      return null;
    }
    return DateFormat('yyyy/MM/dd').format(date);
  }
}
