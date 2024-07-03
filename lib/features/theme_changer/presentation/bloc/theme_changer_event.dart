part of 'theme_changer_bloc.dart';

@immutable
sealed class ThemeChangerEvent {}

class ThemeToNightEvent extends ThemeChangerEvent {}

class ThemeToDayEvent extends ThemeChangerEvent {}
