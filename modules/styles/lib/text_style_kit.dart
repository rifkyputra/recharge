import 'package:flutter/material.dart';

class TextStyleKit {
  static const defaultColor = Colors.black87;

  static const primaryColor = Colors.blue;

  static const secondaryColor = Colors.grey;

  static const biggestSize = 42.0;
  static const hugeSize = 32.0;
  static const extraLargeSize = 32.0;
  static const veryLargeSize = 32.0;

  static TextStyle biggest() {
    return TextStyle(fontSize: biggestSize);
  }

  static TextStyle huge() {
    return TextStyle(fontSize: hugeSize);
  }

  /// [extraLargeSize]
  static TextStyle extraLarge() {
    return TextStyle(fontSize: extraLargeSize);
  }

  static TextStyle veryLarge() {
    return TextStyle(fontSize: veryLargeSize);
  }

  static TextStyle large() {
    return TextStyle(fontSize: veryLargeSize);
  }

  static TextStyle medium() {
    return TextStyle(fontSize: veryLargeSize);
  }

  static TextStyle smallMedium() {
    return TextStyle(fontSize: veryLargeSize);
  }

  static TextStyle small() {
    return TextStyle(fontSize: veryLargeSize);
  }

  static TextStyle verySmall() {
    return TextStyle(fontSize: veryLargeSize);
  }

  static TextStyle extraSmall() {
    return TextStyle(fontSize: veryLargeSize);
  }

  static TextStyle tiny() {
    return TextStyle(fontSize: veryLargeSize);
  }

  static TextStyle smallest() {
    return TextStyle(fontSize: veryLargeSize);
  }
}

extension TextStyleWeight on TextStyle {
  TextStyle get w200 {
    return this.copyWith(fontWeight: FontWeight.w200);
  }

  TextStyle get w400 {
    return this.copyWith(fontWeight: FontWeight.w400);
  }

  TextStyle get w600 {
    return this.copyWith(fontWeight: FontWeight.w600);
  }
}

extension TextStyleColor on TextStyle {
  TextStyle withColor({Color? bgColor, Color? color, Color? decorColor}) {
    return this.copyWith(
      backgroundColor: bgColor,
      color: color,
      decorationColor: decorColor,
    );
  }
}
