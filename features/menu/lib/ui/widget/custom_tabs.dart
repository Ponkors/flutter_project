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
              const SizedBox(height: AppDimens.size_5),
              Text(
                'menuScreen.categories'.tr(),
                style: GoogleFonts.poppins(
                  textStyle: AppFonts.normal_18_bold,
                  color: themeData.primaryColor,
                ),
              ),
              const SizedBox(height: AppDimens.size_5),
              Wrap(
                spacing: AppDimens.size_10,
                runSpacing: AppDimens.size_5,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: List<Widget>.generate(state.categories.length, (int index) {
                  bool isSelected = selectedTab == index;
                  return GestureDetector(
                    onTap: () {
                      selectedTab = index;
                      bloc.add(FilteringDishesCategory(category: state.categories[index]));
                    },
                    child: AnimatedCrossFade(
                      firstChild: _buildCategoryChild(state.categories[index], themeData, mediaQueryData, isSelected: true),
                      secondChild: _buildCategoryChild(state.categories[index], themeData, mediaQueryData, isSelected: false),
                      crossFadeState: isSelected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 500),
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

  Widget _buildCategoryChild(String category, ThemeData themeData, MediaQueryData mediaQueryData, {bool isSelected = false}) {
    return Container(
      width: mediaQueryData.size.width * 0.43,
      height: mediaQueryData.size.height * 0.04,
      padding: const EdgeInsets.all(AppDimens.size_4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.radius_10),
        color: isSelected ? themeData.primaryColor : AppColors.white,
      ),
      child: Center(
        child: Text(
          category,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? AppColors.white : AppColors.grey,
          ),
        ),
      ),
    );
  }
}
