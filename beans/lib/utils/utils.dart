import 'package:flutter/material.dart';

class Utils {
  static Color batteryColor(int percentage) {
    if (percentage < 25) {
      return Colors.red;
    }

    if (percentage <= 60) {
      return Colors.orange;
    }

    return Colors.green;
  }
}
