import 'package:core/core.dart';
import 'package:data/data.dart';


class OrdersHistoryDataProviderImpl implements OrdersHistoryDataProvider {
  final FirebaseFirestore _firebaseFirestore;

  const OrdersHistoryDataProviderImpl({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

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
}