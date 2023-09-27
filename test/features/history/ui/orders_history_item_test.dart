import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:history/history.dart';

void main() {
  final DateTime testDateTime = DateTime(22, 9, 2023, 15, 30);
  final DishModel testDish = DishModel(
    id: '1',
    title: 'Pizza',
    imageURL: 'image.png',
    cost: 10,
  );
  final OrdersHistoryModel ordersHistoryModel = OrdersHistoryModel(
    cart: CartModel(
      totalPrice: 60,
      dishes: [
        CartDish(
          dish: testDish,
          quantity: 2,
        ),
        CartDish(
          dish: testDish.copyWith(title: 'Pasta', cost: 20),
          quantity: 1,
        )
      ],
    ),
    dateTime: testDateTime,
    id: '123abc',
    isReady: true,
  );

  testWidgets('Check, if displays correct order price.',
          (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: Material(
            child: Scaffold(
              body: OrdersHistoryItem(ordersHistoryItem: ordersHistoryModel),
            ),
          ),
        ));
        expect(find.text('orderHistoryScreen.price'.tr() + ' \$60'), findsOneWidget);
      });

  testWidgets('Check, if displays correct dateTime.',
          (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: Material(
            child: Scaffold(
              body: OrdersHistoryItem(ordersHistoryItem: ordersHistoryModel),
            ),
          ),
        ));
        expect(
            find.text(DateFormat('dd/MM/yyyy hh:mm').format(testDateTime)),
            findsOneWidget);
      });

  testWidgets('Check, if displays correct dish details',
          (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: Material(
            child: Scaffold(
              body: OrdersHistoryItem(ordersHistoryItem: ordersHistoryModel),
            ),
          ),
        ));
        await tester.tap(find.byType(ExpansionTile));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 1));
        // await tester.pumpAndSettle();
        expect(find.text('  ●  Pizza'), findsOneWidget);
        expect(find.text('  ●  Pasta'), findsOneWidget);
        expect(find.text('\$10 x 2'), findsOneWidget);
        expect(find.text('\$20 x 1'), findsOneWidget);
      });

  testWidgets('Check, if displays correct order id.',
          (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: Material(
            child: Scaffold(
              body: OrdersHistoryItem(ordersHistoryItem: ordersHistoryModel),
            ),
          ),
        ));
        await tester.tap(find.byType(ExpansionTile));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 1));
        expect(find.text('orderHistoryScreen.id'.tr() + ' 123abc'), findsOneWidget);
      });
}
