import 'package:flutter/material.dart';
import 'package:my_resume_app/core/theme/extensions/icons_app_theme.dart';
import 'package:my_resume_app/core/theme/extensions/texts_app_theme.dart';

extension ThemeDataExtended on ThemeData {
  IconsAppTheme get appIconsTheme => extension<IconsAppTheme>()!;
  TextsAppTheme get appTextsTheme => extension<TextsAppTheme>()!;
}
