import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:menu/bloc/menu_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_tools/mocks.dart';

final List<DishModel> dishes = [
  DishModel(
    id: '7',
    title: 'Cookie Sandwich',
    imageURL: 'image.png',
    cost: 10,
    category: 'Chinese',
  ),
  DishModel(
    id: '8',
    title: 'Oyster Dish',
    imageURL: 'image.png',
    cost: 7,
    category: 'Spanish',
  ),
];
final List<DishModel> dishesEmpty = [];

void main() {
  late DishesBloc dishesBloc;
  late MockFetchAllDishesUseCase mockFetchAllDishesUseCase;
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockFetchAllDishesUseCase = MockFetchAllDishesUseCase();
    dishesBloc = DishesBloc(
      fetchAllDishesUseCase: mockFetchAllDishesUseCase,
    );
    when(
          () => mockFetchAllDishesUseCase.execute(
        const NoParams(),
      ),
    ).thenAnswer(
          (_) async => Future.value(
        <DishModel>[],
      ),
    );
  });

  group('DishesBloc', () {
    void fetchAllDishes() async {
      when(
            () => mockFetchAllDishesUseCase.execute(
          const NoParams(),
        ),
      ).thenAnswer((_) async => dishes);
    }

    test('Check initial state.', () async {
      expect(dishesBloc.state.listOfDishes, []);
      expect(dishesBloc.state.dishesOfEnteredCategory, []);
      expect(dishesBloc.state.isLoading, true);
      expect(dishesBloc.state.exception, null);
    });

    test('Check list of dishes is load', () async {
      fetchAllDishes();
      dishesBloc.emit(
        dishesBloc.state.copyWith(
          listOfDishes: dishes,
        ),
      );
      expect(dishesBloc.state.listOfDishes, dishes);
      verify(
            () => mockFetchAllDishesUseCase.execute(
          const NoParams(),
        ),
      ).called(1);
    });

    test('Check case when entered category = Spanish', () async {
      dishesBloc.emit(
        dishesBloc.state.copyWith(
          listOfDishes: dishes,
        ),
      );
      dishesBloc.add(
        FilteringDishesCategory(category: 'Spanish'),
      );
      final List<DishModel> selectedDishes = dishes
          .where((dish) => dish.category == 'Spanish')
          .toList();
      dishesBloc.emit(
        dishesBloc.state.copyWith(
          dishesOfEnteredCategory: selectedDishes,
        ),
      );
      expect(dishesBloc.state.dishesOfEnteredCategory, selectedDishes);
      expect(dishesBloc.state.dishesOfEnteredCategory.length, 1);
    });

    test('Check case when entered category = All Section', () async {
      dishesBloc.emit(
        dishesBloc.state.copyWith(
          listOfDishes: dishes,
        ),
      );
      dishesBloc.add(
        FilteringDishesCategory(
          category: Category.all.getStringValue(),
        ),
      );
      expect(dishesBloc.state.dishesOfEnteredCategory, []);
      expect(dishesBloc.state.listOfDishes, dishes);
    });

  });
}