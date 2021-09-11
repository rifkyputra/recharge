import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class TextStyleKit {
  static const defaultColor = Colors.black87;

  static const primaryColor = Colors.blue;

  static const secondaryColor = Colors.grey;

  static const _biggestSize = 42.0;
  static const _hugeSize = 32.0;
  static const _extraLargeSize = 32.0;
  static const _veryLargeSize = 32.0;

  // BIGGEST
  static const biggest = TextStyle(
    fontSize: _biggestSize,
    fontWeight: FontWeight.w400,
  );
  static const biggestBold = TextStyle(
    fontSize: _biggestSize,
    fontWeight: FontWeight.w700,
  );
  static const biggestLight = TextStyle(
    fontSize: _biggestSize,
    fontWeight: FontWeight.w300,
  );

  // HUGE
  static const huge = TextStyle(
    fontSize: _hugeSize,
    fontWeight: FontWeight.normal,
  );
  static const hugeBold = TextStyle(
    fontSize: _hugeSize,
    fontWeight: FontWeight.bold,
  );
  static const hugeLight = TextStyle(
    fontSize: _hugeSize,
    fontWeight: FontWeight.w300,
  );

  //EXTRA LARGE
  static const extraLarge = TextStyle(
    fontSize: _extraLargeSize,
    fontWeight: FontWeight.normal,
  );
  static const extraLargeBold = TextStyle(
    fontSize: _extraLargeSize,
    fontWeight: FontWeight.bold,
  );
  static const extraLargeLight = TextStyle(
    fontSize: _extraLargeSize,
    fontWeight: FontWeight.w300,
  );

  // VERY LARGE
  static const veryLarge = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.normal,
  );
  static const veryLargeBold = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.bold,
  );
  static const veryLargeLight = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.w300,
  );

  // LARGE
  static const large = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.normal,
  );
  static const largeBold = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.bold,
  );
  static const largeLight = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.w300,
  );

  // MEDIUM
  static const medium = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.normal,
  );
  static const mediumBold = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.bold,
  );
  static const mediumLight = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.w300,
  );

  // SMALL MEDIUM
  static const smallMedium = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.normal,
  );
  static const smallMediumBold = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.bold,
  );
  static const smallMediumLight = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.w300,
  );

  // SMALL
  static const small = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.normal,
  );
  static const smallBold = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.bold,
  );
  static const smallLight = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.w300,
  );

  // VERY SMALL
  static const verySmall = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.normal,
  );
  static const verySmallBold = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.bold,
  );
  static const verySmallLight = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.w300,
  );

  // EXTRA SMALL
  static const extraSmall = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.normal,
  );
  static const extraSmallBold = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.bold,
  );
  static const extraSmallLight = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.w300,
  );

  // TINY
  static const tiny = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.normal,
  );
  static const tinyBold = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.bold,
  );
  static const tinyLight = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.w300,
  );

  // SMALLEST
  static const smallest = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.normal,
  );
  static const smallestBold = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.bold,
  );
  static const smallestLight = TextStyle(
    fontSize: _veryLargeSize,
    fontWeight: FontWeight.w300,
  );
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
  TextStyle fill({Color? bgColor, Color? color, Color? decorColor}) {
    return this.copyWith(
      backgroundColor: bgColor,
      color: color,
      decorationColor: decorColor,
    );
  }
}
