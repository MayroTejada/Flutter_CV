import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_resume_app/core/theme/extensions/icons_app_theme.dart';
import 'package:my_resume_app/core/theme/extensions/texts_app_theme.dart';
import 'package:my_resume_app/core/theme/my_theme.dart';

part 'theme_changer_event.dart';
part 'theme_changer_state.dart';

final Iterable<ThemeExtension<dynamic>> ligthExtensions = [
  IconsAppTheme.light(),
  TextsAppTheme.light()
];
final Iterable<ThemeExtension<dynamic>> darkExtensions = [
  IconsAppTheme.dark(),
  TextsAppTheme.dark()
];

class ThemeChangerBloc extends Bloc<ThemeChangerEvent, ThemeChangerState> {
  ThemeChangerBloc()
      : super(ThemeChangerState(
            stateEnum: ThemeChangetStateEnum.day,
            themeData: const MaterialTheme(TextTheme())
                .light()
                .copyWith(extensions: ligthExtensions))) {
    on<ThemeToNightEvent>(_themeChangeToNightEvent);
    on<ThemeToDayEvent>(_themeChangeToDayEvent);
  }

  FutureOr<void> _themeChangeToNightEvent(
      ThemeToNightEvent event, Emitter<ThemeChangerState> emit) async {
    emit(state.copyWith(
        themeData: const MaterialTheme(TextTheme())
            .dark()
            .copyWith(extensions: darkExtensions),
        stateEnum: ThemeChangetStateEnum.night));
  }

  FutureOr<void> _themeChangeToDayEvent(
      ThemeToDayEvent event, Emitter<ThemeChangerState> emit) async {
    emit(state.copyWith(
        themeData: const MaterialTheme(TextTheme())
            .light()
            .copyWith(extensions: ligthExtensions),
        stateEnum: ThemeChangetStateEnum.day));
  }
}
