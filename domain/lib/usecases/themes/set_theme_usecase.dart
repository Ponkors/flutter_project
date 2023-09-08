import 'package:domain/repositories/theme_repository.dart';
import 'package:domain/usecases/usecases.dart';

class SetThemeUseCase implements FutureUseCase<void, bool> {
  final ThemeRepository _themeRepository;

  const SetThemeUseCase({required ThemeRepository themeRepository})
      : _themeRepository = themeRepository;

  @override
  Future<void> execute(bool input) => _themeRepository.saveAppTheme(input);
}
