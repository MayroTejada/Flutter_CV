import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_resume_app/core/theme/my_theme.dart';

part 'theme_changer_event.dart';
part 'theme_changer_state.dart';

class ThemeChangerBloc extends Bloc<ThemeChangerEvent, ThemeChangerState> {
  ThemeChangerBloc()
      : super(ThemeChangerState(
            stateEnum: ThemeChangetStateEnum.day,
            themeData: ThemeData.from(
                colorScheme: MaterialTheme.lightScheme().toColorScheme()))) {
    on<ThemeToNightEvent>(_themeChangeToNightEvent);
    on<ThemeToDayEvent>(_themeChangeToDayEvent);
  }

  FutureOr<void> _themeChangeToNightEvent(
      ThemeToNightEvent event, Emitter<ThemeChangerState> emit) async {
    emit(state.copyWith(
        themeData: ThemeData.from(
            colorScheme: MaterialTheme.darkScheme().toColorScheme()),
        stateEnum: ThemeChangetStateEnum.night));
  }

  FutureOr<void> _themeChangeToDayEvent(
      ThemeToDayEvent event, Emitter<ThemeChangerState> emit) async {
    emit(state.copyWith(
        themeData: ThemeData.from(
            colorScheme: MaterialTheme.lightScheme().toColorScheme()),
        stateEnum: ThemeChangetStateEnum.day));
  }
}
