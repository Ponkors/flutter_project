import 'package:domain/domain.dart';
import 'package:domain/repositories/settings_repository.dart';

class CheckThemeTypeUseCase implements FutureUseCase<NoParams, bool> {
  final SettingsRepository _settingsRepository;

  CheckThemeTypeUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  @override
  Future<bool> execute(NoParams input) async {
    return _settingsRepository.checkThemeType();
  }
}