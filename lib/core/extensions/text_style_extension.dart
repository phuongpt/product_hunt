import 'package:flutter/material.dart';

import 'package:product_hunt/core/constants/color_palatte.dart';

extension ExtendedTextStyle on TextStyle {
  //weight
  TextStyle get light {
    return copyWith(fontWeight: FontWeight.w300);
  }

  TextStyle get regular {
    return copyWith(fontWeight: FontWeight.w400);
  }

  TextStyle get italic {
    return copyWith(
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic,
    );
  }

  TextStyle get medium {
    return copyWith(fontWeight: FontWeight.w500);
  }

  TextStyle get semibold {
    return copyWith(fontWeight: FontWeight.w600);
  }

  TextStyle get bold {
    return copyWith(fontWeight: FontWeight.w700);
  }

//size
  TextStyle get fontHeader {
    return copyWith(
      fontSize: 22,
      height: 22 / 20,
    );
  }

  TextStyle get fontTitle {
    return copyWith(
      fontSize: 18,
      height: 18 / 16,
    );
  }

  TextStyle get fontButton {
    return copyWith(
      fontSize: 18,
      height: 18 / 16,
    );
  }

  TextStyle get fontSubTitle {
    return copyWith(
      fontSize: 16,
      height: 16 / 14,
    );
  }

  TextStyle get fontCaption {
    return copyWith(
      fontSize: 12,
      height: 12 / 10,
    );
  }

  //color
  TextStyle get textColor {
    return copyWith(color: ColorPalette.textColor);
  }

  TextStyle get primaryTextColor {
    return copyWith(color: ColorPalette.primaryColor);
  }

  TextStyle get subTitleColor {
    return copyWith(color: ColorPalette.subTitleColor);
  }

  TextStyle get lightTextColor {
    return copyWith(color: Colors.white);
  }

  TextStyle get darkTextColor {
    return copyWith(color: Colors.black);
  }

  // convenience functions
  TextStyle setColor(Color color) {
    return copyWith(color: color);
  }

  TextStyle setTextSize(double size) {
    return copyWith(fontSize: size);
  }
}

class TextStyles {
  TextStyles(this.context);

  BuildContext? context;

  static const TextStyle defaultStyle = TextStyle(
    fontSize: 14,
    color: ColorPalette.textColor,
    fontWeight: FontWeight.w400,
    height: 16 / 14,
  );
}

// How to use?
// Text('test text', style: TextStyles.normalText.semibold.whiteColor);
// Text('test text', style: TextStyles.itemText.whiteColor.bold);