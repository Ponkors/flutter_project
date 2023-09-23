import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:menu/menu.dart';
import 'package:flutter/material.dart';

class CustomTabs extends StatelessWidget {
  const CustomTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final DishesBloc bloc = BlocProvider.of(context);
    int selectedTab = 0;
    return BlocBuilder<DishesBloc, DishesState>(
      builder: (_, DishesState state) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.padding_20,
          ),
          child: Column(
            children: [
              Text(
                'Categories:',
                style: GoogleFonts.poppins(
                  textStyle: AppFonts.normal_16,
                ),
              ),
              Wrap(
                spacing: AppDimens.size_30,
                runSpacing: AppDimens.size_4,
                children: List<Widget>.generate(state.categories.length, (int index) {
                  bool isSelected = selectedTab == index;
                  return GestureDetector(
                    onTap: () {
                      selectedTab = index;
                      bloc.add(FilteringDishesCategory(category: state.categories[index]));
                    },
                    child: AnimatedContainer(
                      width: mediaQueryData.size.width * 1, // or 2
                      duration: const Duration(microseconds: 200),
                      curve: Curves.linear,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppDimens.radius_10),
                        color: isSelected ? themeData.primaryColor : AppColors.white,
                      ),
                      child: Center(
                        child: Text(
                          state.categories[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isSelected ? AppColors.white : AppColors.grey,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
