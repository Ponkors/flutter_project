import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:core/core.dart';

class DishesRepositoryImpl implements DishesRepository {
  final FirebaseFirestoreDataProvider _firebaseFirestoreDataProvider;
  final HiveProvider _hiveProvider;

  const DishesRepositoryImpl({
    required FirebaseFirestoreDataProvider firebaseFirestoreDataProvider,
    required HiveProvider hiveProvider,
  }) : _firebaseFirestoreDataProvider = firebaseFirestoreDataProvider,
       _hiveProvider = hiveProvider;

  @override
  Future<List<DishModel>> fetchAllDishes() async {
    final List<DishModel> dishes;
    final bool haveInternetConnection =
        await InternetConnectionInfo.checkInternetConnection();
    if (haveInternetConnection) {
      final List<DishEntity> result =
          await _firebaseFirestoreDataProvider.getAllDishes();
      dishes = result.map((DishEntity e) => DishMapper.toModel(e)).toList();
      await _hiveProvider.saveDishesToCache(dishes);
    } else {
      final List<DishEntity> result = await _hiveProvider.getCachedDishes();
      dishes = result.map((DishEntity e) => DishMapper.toModel(e)).toList();
    }
    return dishes;
  }
}