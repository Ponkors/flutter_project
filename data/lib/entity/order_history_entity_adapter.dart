import 'package:core/core.dart';
import 'package:data/data.dart';

class OrdersHistoryEntityAdapter extends TypeAdapter<OrdersHistoryEntity> {
  @override
  final int typeId = 4;

  @override
  OrdersHistoryEntity read(BinaryReader reader) {
    final CartEntity cart = reader.read() as CartEntity;
    final DateTime dateTime = reader.read() as DateTime;
    final String id = reader.read() as String;
    final bool isReady = reader.read() as bool;

    return OrdersHistoryEntity(
      cart: cart,
      dateTime: dateTime,
      id: id,
      isReady: isReady,
    );
  }

  @override
  void write(BinaryWriter writer, OrdersHistoryEntity object) {
    writer.write(object.cart);
    writer.write(object.dateTime);
    writer.write(object.id);
    writer.write(object.isReady);
  }
}