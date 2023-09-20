import 'package:domain/domain.dart';
import 'package:domain/repositories/settings_repository.dart';

class CheckFontSizeUseCase implements FutureUseCase<NoParams, double> {
  final SettingsRepository _settingsRepository;

  CheckFontSizeUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  @override
  Future<double> execute(NoParams input) async {
    return _settingsRepository.checkFontSize();
  }
}