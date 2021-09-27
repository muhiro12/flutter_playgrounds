import 'package:flutter/material.dart';

enum Primary { red, blue, green }

extension PrimaryExtension on Primary {
  MaterialColor get color {
    switch (this) {
      case Primary.red:
        return Colors.red;
      case Primary.blue:
        return Colors.blue;
      case Primary.green:
        return Colors.green;
    }
  }
}
