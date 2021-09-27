import 'package:flutter/material.dart';

enum PrimaryColor {
  red,
  blue,
  green,
}

extension PrimaryColorExtension on PrimaryColor {
  MaterialColor get value {
    switch (this) {
      case PrimaryColor.red:
        return Colors.red;
      case PrimaryColor.blue:
        return Colors.blue;
      case PrimaryColor.green:
        return Colors.green;
    }
  }
}
