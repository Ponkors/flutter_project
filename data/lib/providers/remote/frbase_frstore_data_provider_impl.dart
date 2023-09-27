import 'package:data/data.dart';
import 'package:core/core.dart';
import 'dart:io';

class FirebaseFirestoreDataProviderImpl implements FirebaseFirestoreDataProvider {
  final FirebaseFirestore _firebaseFirestore;

  const FirebaseFirestoreDataProviderImpl({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  @override
  Future<List<DishEntity>> getAllDishes() async {
    final QuerySnapshot<Map<String, dynamic>> dataRef =
    await _firebaseFirestore.collection('menu').get();
    return dataRef.docs
        .map((
          QueryDocumentSnapshot<Map<String, dynamic>> dish,
        ) =>
          DishEntity.fromFirebase(dish))
        .toList();
  }

  @override
  Future<void> addOrder(OrdersHistoryEntity ordersHistoryEntity) async {
    final CollectionReference ordersCollection = _firebaseFirestore
        .collection('users')
        .doc(ordersHistoryEntity.id)
        .collection('orders');
    final DocumentReference<Object?> newOrderDocument = ordersCollection.doc();
    await newOrderDocument.set({
      'id': newOrderDocument.id,
      'cart': ordersHistoryEntity.cart.toJson(),
      'dateTime': ordersHistoryEntity.dateTime,
    });
  }

  @override
  Future<List<OrdersHistoryEntity>> fetchOrders(String uid) async {
    final QuerySnapshot<Map<String, dynamic>> listOfDocuments =
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('orders')
          .get();
    return listOfDocuments.docs.map((
      QueryDocumentSnapshot<Map<String, dynamic>> document,
    ) {
      return OrdersHistoryEntity.fromFirebase(document);
    }).toList();
  }

  @override
  Future<UserEntity> getUser({
    required String uid,
  }) async {
    final DocumentSnapshot<Map<String, dynamic>> userDoc =
      await _firebaseFirestore.collection('users').doc(uid).get();
    final Map<String, dynamic>? userData = userDoc.data();
    final UserEntity userEntity = UserEntity(
      identifierId: uid,
      email: userData?['email'] ?? '',
      userName: userData?['name'] ?? '',
      role: userData?['role'] ?? '',
    );
    return userEntity;
  }


  @override
  Future<void> saveUser({
    required String uid,
    required String? userName,
    required String? email,
  }) async {
    final DocumentReference<Map<String, dynamic>> userDataFirebase =
      _firebaseFirestore.collection('users').doc(uid);
    final Map<String, String?> userData = {
      'identifierId': uid,
      'name': userName,
      'email': email,
      'role': UserRole.user.getStringValue(),
    };
    final DocumentSnapshot<Map<String, dynamic>> user =
      await userDataFirebase.get();
    if (!user.exists) {
      userDataFirebase.set(userData);
    }
  }

  // @override
  // Future<void> addProduct({
  //   required DishEntity dishEntity,
  // }) async {
  //   final CollectionReference<Map<String, dynamic>> productsDataFirebase =
  //       _firebaseFirestore.collection('menu');
  //   final DocumentReference<Map<String, dynamic>> newDocumentRef =
  //       productsDataFirebase.doc();
  //   await newDocumentRef.set({
  //     "id": newDocumentRef.id,
  //     "title": newDocumentRef.title,
  //     "imageURL": newDocumentRef.imageURL,
  //     "cost": newDocumentRef.cost,
  //     "description": newDocumentRef.description,
  //     "ingredients": newDocumentRef.ingredients,
  //     "category": newDocumentRef.category,
  //   });
  // }

  @override
  Future<void> updateDish({
    required DishEntity dishEntity,
  }) async {
    final CollectionReference<Map<String, dynamic>> productsDataFirebase =
    _firebaseFirestore.collection('menu');

    await productsDataFirebase.doc(dishEntity.id).update({
      "title": dishEntity.title,
      "imageUrl": dishEntity.imageURL,
      "cost": dishEntity.cost,
      "description": dishEntity.description,
      "ingredients": dishEntity.ingredients,
      "category": dishEntity.category,
    });
  }

  @override
  Future<void> deleteDish({
    required String id,
  }) async {
    await _firebaseFirestore.collection('menu').doc(id).delete();
  }

  @override
  Future<List<UserEntity>> fetchAllUsers() async {
    final QuerySnapshot<Map<String, dynamic>> dataRef =
    await _firebaseFirestore.collection('users').get();

    return dataRef.docs.map((
        QueryDocumentSnapshot<Map<String, dynamic>> user,
        ) {
      return UserEntity.fromFirebase(user);
    }).toList();
  }

  Future<void> updateOrderStatus({
    required String uid,
    required bool isReady,
  }) async {
    final QuerySnapshot<Map<String, dynamic>> usersSnapshot =
    await _firebaseFirestore.collection('users').get();
    for (QueryDocumentSnapshot<Map<String, dynamic>> userDoc
    in usersSnapshot.docs) {
      final CollectionReference<Map<String, dynamic>> ordersCollection =
      userDoc.reference.collection('orders');
      final QuerySnapshot<Map<String, dynamic>> ordersSnapshot =
      await ordersCollection.get();
      for (QueryDocumentSnapshot<Map<String, dynamic>> orderDoc
      in ordersSnapshot.docs) {
        final String orderUid = orderDoc.id;
        if (orderUid == uid) {
          await orderDoc.reference.update({
            'isReady': isReady,
          });
        }
      }
    }
  }

  @override
  Future<void> updateUserRole({
    required String uid,
    required String role,
  }) async {
    final CollectionReference<Map<String, dynamic>> usersDataFirebase =
    _firebaseFirestore.collection('users');

    await usersDataFirebase.doc(uid).update({
      "role": role,
    });
  }

  @override
  Future<List<OrdersHistoryUserInfoEntity>> fetchAllOrders() async {
    final QuerySnapshot<Map<String, dynamic>> listOfDocuments =
    await _firebaseFirestore.collection('users').get();
    List<OrdersHistoryUserInfoEntity> allOrders = [];

    for (QueryDocumentSnapshot<Map<String, dynamic>> userDoc
    in listOfDocuments.docs) {
      final CollectionReference<Map<String, dynamic>> ordersCollection =
      userDoc.reference.collection('orders');
      final QuerySnapshot<Map<String, dynamic>> ordersSnapshot =
      await ordersCollection.get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> orderDoc
          in ordersSnapshot.docs) {
        final Map<String, dynamic> orderData = orderDoc.data();
        final Map<String, dynamic> userData = userDoc.data();

        final UserEntity userEntity = UserEntity.fromJson(userData);
        final OrdersHistoryEntity orderEntity = OrdersHistoryEntity
            .fromJson(orderData);

        final OrdersHistoryUserInfoEntity orderForAdmin =
          OrdersHistoryUserInfoEntity(
            userEntity: userEntity,
            ordersHistoryEntity: orderEntity,
          );

        allOrders.add(orderForAdmin);
      }
    }
    return allOrders;
  }
}