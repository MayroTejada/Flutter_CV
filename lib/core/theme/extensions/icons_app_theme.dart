import 'package:flutter/material.dart';

const Color accentGreen = Color(0xff80d4d4);
const Color strongGreen = Color(0xff004f50);

class IconsAppTheme extends ThemeExtension<IconsAppTheme> {
  final ButtonStyle iconButtonStyle;

  factory IconsAppTheme.light() {
    return IconsAppTheme(
        iconButtonStyle:
            const ButtonStyle(iconColor: WidgetStatePropertyAll(strongGreen)));
  }

  factory IconsAppTheme.dark() {
    return IconsAppTheme(
        iconButtonStyle:
            const ButtonStyle(iconColor: WidgetStatePropertyAll(accentGreen)));
  }

  IconsAppTheme({required this.iconButtonStyle});

  @override
  ThemeExtension<IconsAppTheme> copyWith({ButtonStyle? buttonStyle}) {
    return IconsAppTheme(iconButtonStyle: buttonStyle ?? iconButtonStyle);
  }

  @override
  ThemeExtension<IconsAppTheme> lerp(
          covariant ThemeExtension<IconsAppTheme>? other, double t) =>
      this;
}
