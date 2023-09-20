abstract class SettingsRepository {
  Future<bool> checkThemeMode();
  Future<bool> checkThemeType();
  Future<void> setThemeMode(bool isDark);
  Future<void> setThemeType(bool isSystemTheme);
  Future<void> setFontSize(double textScale);
  Future<double> checkFontSize();
}