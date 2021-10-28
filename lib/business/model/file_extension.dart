import 'dart:io';
import 'package:http/http.dart' as http;

extension FileExtension on File {
  Future<String> readFromNetwork() async {
    final http.Response data = await http.get(Uri.parse(path));
    return data.body;
  }
}
