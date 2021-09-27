import 'package:flutter/material.dart';

enum PrimaryColor {
  red,
  pink,
  purple,
  deepPurple,
  indigo,
  blue,
  lightBlue,
  cyan,
  teal,
  green,
  lightGreen,
  lime,
  yellow,
  abmer,
  orange,
  deepOrange,
  brown,
  grey,
  blueGrey,
}

extension PrimaryColorExtension on PrimaryColor {
  MaterialColor get value {
    switch (this) {
      case PrimaryColor.red:
        return Colors.red;
      case PrimaryColor.pink:
        return Colors.pink;
      case PrimaryColor.purple:
        return Colors.purple;
      case PrimaryColor.deepPurple:
        return Colors.deepPurple;
      case PrimaryColor.indigo:
        return Colors.indigo;
      case PrimaryColor.blue:
        return Colors.blue;
      case PrimaryColor.lightBlue:
        return Colors.lightBlue;
      case PrimaryColor.cyan:
        return Colors.cyan;
      case PrimaryColor.teal:
        return Colors.teal;
      case PrimaryColor.green:
        return Colors.green;
      case PrimaryColor.lightGreen:
        return Colors.lightGreen;
      case PrimaryColor.lime:
        return Colors.lime;
      case PrimaryColor.yellow:
        return Colors.yellow;
      case PrimaryColor.abmer:
        return Colors.amber;
      case PrimaryColor.orange:
        return Colors.orange;
      case PrimaryColor.deepOrange:
        return Colors.deepOrange;
      case PrimaryColor.brown:
        return Colors.brown;
      case PrimaryColor.grey:
        return Colors.grey;
      case PrimaryColor.blueGrey:
        return Colors.blueGrey;
    }
  }
}
