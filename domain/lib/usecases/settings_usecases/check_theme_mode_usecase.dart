import 'package:domain/domain.dart';
import 'package:domain/repositories/settings_repository.dart';

class CheckThemeModeUseCase implements FutureUseCase<NoParams, bool> {
  final SettingsRepository _settingsRepository;

  CheckThemeModeUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  @override
  Future<bool> execute(NoParams input) async {
    return _settingsRepository.checkThemeMode();
  }
}