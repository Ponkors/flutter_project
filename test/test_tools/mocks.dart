import 'package:bloc_test/bloc_test.dart';
import 'package:domain/domain.dart';
import 'package:data/data.dart';
import 'package:history/bloc/history_bloc.dart';
import 'package:menu/bloc/menu_bloc.dart';
import 'package:mocktail/mocktail.dart';


class MockUserModel extends Mock implements UserModel {}
class FirebaseFirestoreDataProviderMock extends Mock implements
    FirebaseFirestoreDataProvider {}
class FirebaseAuthProviderMock extends Mock implements FirebaseAuthProvider {}
class HiveProviderMock extends Mock implements HiveProvider {}
class MockOrdersHistoryBloc extends MockBloc<OrdersHistoryEvent,
    OrdersHistoryState> implements OrdersHistoryBloc {}
class MockDishesBloc extends MockBloc<DishesEvent, DishesState> implements
    DishesBloc {}
class MockFetchAllDishesUseCase extends Mock implements FetchAllDishesUseCase {}