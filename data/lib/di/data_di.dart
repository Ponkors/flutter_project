import 'package:data/di/menu_di.dart';
import 'package:data/di/theme_di.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    await menuDI.initDependencies();
    await themeDI.initDependencies();
  }
}
