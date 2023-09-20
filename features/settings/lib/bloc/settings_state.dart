part of 'settings_bloc.dart';

class SettingsState {
  final ThemeData themeData;
  final bool isDark;
  final bool systemTheme;
  final double textScale;

  SettingsState.empty(
    this.themeData,
    this.isDark,
    this.systemTheme,
    this.textScale,
  );

  SettingsState copyWith({
    ThemeData? themeData,
    bool? isDark,
    bool? systemTheme,
    double? textScale,
  }) {
    return SettingsState.empty(
      themeData ?? this.themeData,
      isDark ?? this.isDark,
      systemTheme ?? this.systemTheme,
      textScale ?? this.textScale,
    );
  }
}
