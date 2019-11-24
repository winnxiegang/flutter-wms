import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/common_utils.dart';

/**
 * textView 统一封装使用
 */
class TextStyleUtils {
  static const lagerTextSize = 30.0;
  static const bigTextSize = 20.0;
  static const normalTextSize = 16.0;
  static const middleTextWhiteSize = 16.0;
  static const smallTextSize = 14.0;
  static const minTextSize = 12.0;
  static const NormalTextStyle = TextStyle(
    color: CommonColors.mainColor,
    fontSize: 16,
  );
  static const LoginInputTextStyle = TextStyle(
    color: Color(0xFF202020),
    fontSize: 15,
  );
  static const LoginHintTextStyle = TextStyle(
    color: Color(0xFFbcbcbc),
    fontSize: 15,
  );

  ///基本提交按钮
  static const SubmitButtonTewxt = TextStyle(
    color: Colors.white,
    fontSize: middleTextWhiteSize,
  );

  static const smallText = TextStyle(
    color: CommonColors.mainColor,
    fontSize: smallTextSize,
  );

////
  static const mineTextLeftStyle = TextStyle(
    color: CommonColors.mainBlackColor,
    fontSize: bigTextSize,
  );
  static const mineTextRightStyle = TextStyle(
    color: CommonColors.mainBlackFF99Color,
    fontSize: normalTextSize,
  );

  static const smallSubLightText = TextStyle(
    color: CommonColors.mainColor,
    fontSize: smallTextSize,
  );

  static const smallActionLightText = TextStyle(
    color: CommonColors.mainColor,
    fontSize: smallTextSize,
  );

  static const smallMiLightText = TextStyle(
    color: CommonColors.mainColor,
    fontSize: smallTextSize,
  );

  static const smallSubText = TextStyle(
    color: CommonColors.mainColor,
    fontSize: smallTextSize,
  );

  static const middleText = TextStyle(
    color: CommonColors.mainColor,
    fontSize: middleTextWhiteSize,
  );

  static const middleTextWhite = TextStyle(
    color: CommonColors.mainColor,
    fontSize: middleTextWhiteSize,
  );

  static const middleSubText = TextStyle(
    color: CommonColors.mainColor,
    fontSize: middleTextWhiteSize,
  );

  static const middleSubLightText = TextStyle(
    color: CommonColors.mainColor,
    fontSize: middleTextWhiteSize,
  );

  static const middleTextBold = TextStyle(
    color: CommonColors.mainColor,
    fontSize: middleTextWhiteSize,
    fontWeight: FontWeight.bold,
  );
}
