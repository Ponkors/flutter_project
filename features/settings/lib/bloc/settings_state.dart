part of 'settings_bloc.dart';

class SettingsState {
  final ThemeData themeData;
  final bool isDark;
  final bool systemTheme;
  final double textScale;

  SettingsState({
    required this.themeData,
    required this.isDark,
    required this.systemTheme,
    required this.textScale,
  });

  SettingsState.empty()
    : themeData = AppTheme.lightTheme,
      isDark = false,
      systemTheme = false,
      textScale = 1.1;

  SettingsState copyWith({
    ThemeData? themeData,
    bool? isDark,
    bool? systemTheme,
    double? textScale,
  }) {
    return SettingsState(
      themeData: themeData ?? this.themeData,
      isDark: isDark ?? this.isDark,
      systemTheme: systemTheme ?? this.systemTheme,
      textScale: textScale ?? this.textScale,
    );
  }
}
