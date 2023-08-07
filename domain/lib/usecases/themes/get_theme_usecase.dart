import 'package:domain/repositories/theme_repository.dart';
import 'package:domain/usecases/usecases.dart';

class GetThemeUseCase implements FutureUseCase<bool, NoParams> {
  final ThemeRepository _themeRepository;

  const GetThemeUseCase({required ThemeRepository themeRepository})
      : _themeRepository = themeRepository;

  @override
  Future<bool> execute(NoParams input) => _themeRepository.getAppTheme();
}
