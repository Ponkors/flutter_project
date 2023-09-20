import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final CheckThemeTypeUseCase _checkThemeTypeUseCase;
  final CheckThemeModeUseCase _checkThemeModeUseCase;
  final CheckFontSizeUseCase _checkFontSizeUseCase;
  final SetThemeTypeUseCase _setThemeTypeUseCase;
  final SetThemeModeUseCase _setThemeModeUseCase;
  final SetFontSizeUseCase _setFontSizeUseCase;

  SettingsBloc({
    required CheckThemeTypeUseCase checkThemeTypeUseCase,
    required CheckThemeModeUseCase checkThemeModeUseCase,
    required CheckFontSizeUseCase checkFontSizeUseCase,
    required SetThemeTypeUseCase setThemeTypeUseCase,
    required SetThemeModeUseCase setThemeModeUseCase,
    required SetFontSizeUseCase setFontSizeUseCase,
  }): _checkThemeTypeUseCase = checkThemeTypeUseCase,
      _checkThemeModeUseCase = checkThemeModeUseCase,
      _checkFontSizeUseCase = checkFontSizeUseCase,
      _setThemeTypeUseCase = setThemeTypeUseCase,
      _setThemeModeUseCase = setThemeModeUseCase,
      _setFontSizeUseCase = setFontSizeUseCase,
      super(
        SettingsState.empty(
            AppTheme.lightTheme,
            false,
            false,
            1.1,
        ),
      ) {
    on<InitSettings>(_initSettings);
    on<ChangeThemeType>(_changeThemeType);
    on<ChangeThemeMode>(_changeThemeMode);
    on<ChangeFontSize>(_changeFontSize);
    add(InitSettings());
  }

  Future<void> _initSettings(
      InitSettings event,
      Emitter<SettingsState> emit,
      ) async {
    final bool isSystemTheme = await _checkThemeTypeUseCase.execute(
      const NoParams(),
    );

    final double textScale = await _checkFontSizeUseCase.execute(
      const NoParams(),
    );

    emit(state.copyWith(textScale: textScale));

    if (isSystemTheme) {
      emit(
        state.copyWith(systemTheme: isSystemTheme),
      );
    } else {
      final bool isDark = await _checkThemeModeUseCase.execute(
        const NoParams(),
      );
      emit(
        state.copyWith(
          themeData: isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
        ),
      );
    }
  }

  Future<void> _changeThemeMode(
      ChangeThemeMode event,
      Emitter<SettingsState> emit,
      ) async {
    await _setThemeModeUseCase.execute(event.isDark);
    emit(
      state.copyWith(isDark: event.isDark),
    );
    emit(
      state.copyWith(
        themeData: event.isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
      ),
    );
  }

  Future _changeThemeType(
      ChangeThemeType event,
      Emitter<SettingsState> emit,
      ) async {
    await _setThemeTypeUseCase.execute(event.isSystemTheme);
    emit(
      state.copyWith(systemTheme: event.isSystemTheme),
    );
  }

  Future<void> _changeFontSize(
      ChangeFontSize event,
      Emitter<SettingsState> emit,
      ) async {
    await _setFontSizeUseCase.execute(event.textScale);
    emit(state.copyWith(textScale: event.textScale));
  }
}
