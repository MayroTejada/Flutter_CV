part of 'theme_changer_bloc.dart';

enum ThemeChangetStateEnum { day, night }

class ThemeChangerState extends Equatable {
  final ThemeChangetStateEnum stateEnum;
  final ThemeData themeData;

  const ThemeChangerState({required this.themeData, required this.stateEnum});

  ThemeChangerState copyWith(
      {ThemeData? themeData, ThemeChangetStateEnum? stateEnum}) {
    return ThemeChangerState(
        themeData: themeData ?? this.themeData,
        stateEnum: stateEnum ?? this.stateEnum);
  }

  @override
  List<Object?> get props => [themeData, stateEnum];
}
