import 'package:flutter/material.dart';

const Color accentGreen = Color(0xff80d4d4);
const Color strongGreen = Color(0xff004f50);

class TextsAppTheme extends ThemeExtension<TextsAppTheme> {
  final TextStyle textStyle;

  factory TextsAppTheme.light() {
    return TextsAppTheme(textStyle: const TextStyle(color: strongGreen));
  }

  factory TextsAppTheme.dark() {
    return TextsAppTheme(textStyle: const TextStyle(color: accentGreen));
  }

  TextsAppTheme({required this.textStyle});

  @override
  ThemeExtension<TextsAppTheme> copyWith({TextStyle? textStyle}) {
    return TextsAppTheme(textStyle: textStyle ?? this.textStyle);
  }

  @override
  ThemeExtension<TextsAppTheme> lerp(
          covariant ThemeExtension<TextsAppTheme>? other, double t) =>
      this;
}
