import 'package:data/data.dart';
import 'package:domain/domain.dart';

class AdminPanelRepositoryImpl implements AdminPanelRepository {
  final FirebaseFirestoreDataProvider _firebaseFirestoreDataProvider;

  const AdminPanelRepositoryImpl({
    required FirebaseFirestoreDataProvider firebaseFirestoreDataProvider,
  }) : _firebaseFirestoreDataProvider = firebaseFirestoreDataProvider;

  @override
  Future<void> updateProduct({
    required DishModel dishModel,
  }) async {
    await _firebaseFirestoreDataProvider.updateDish(
      dishEntity: DishMapper.toEntity(dishModel),
    );
  }

  @override
  Future<List<UserModel>> fetchAllUsers() async {
    final List<UserEntity> listOfUsers =
    await _firebaseFirestoreDataProvider.fetchAllUsers();

    return listOfUsers.map(
          (UserEntity userEntity) {
        return UserMapper.toModel(userEntity);
      },
    ).toList();
  }

  @override
  Future<void> updateUserRole({
    required String uid,
    required String role,
  }) async {
    await _firebaseFirestoreDataProvider.updateUserRole(
      uid: uid,
      role: role,
    );
  }

  @override
  Future<void> updateOrderStatus({
    required String uid,
    required bool isReady,
  }) async {
    await _firebaseFirestoreDataProvider.updateOrderStatus(
      uid: uid,
      isReady: isReady,
    );
  }

  @override
  Future<List<OrdersHistoryUserInfoModel>> fetchAllOrders() async {
    final List<OrdersHistoryUserInfoEntity> listOfOrders =
    await _firebaseFirestoreDataProvider.fetchAllOrders();

    return listOfOrders.map(
          (OrdersHistoryUserInfoEntity orderForAdminEntity) {
        return OrdersHistoryUserInfoMapper.toModel(orderForAdminEntity);
      },
    ).toList();
  }

  @override
  Future<void> deleteProduct({
    required String id,
  }) async {
    await _firebaseFirestoreDataProvider.deleteDish(
      id: id,
    );
  }
}