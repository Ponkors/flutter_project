import 'package:flutter/material.dart';
import 'package:menu/bloc/menu_bloc.dart';
import 'package:menu/ui/widget/food_menu_widget.dart';
import 'package:menu/ui/widget/header.dart';
import 'package:menu/ui/widget/horizontal_food_list.dart';
import 'package:menu/ui/widget/properties.dart';
import 'package:menu/ui/widget/vertical_food_list.dart';

import 'menu_list.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';

class MenuForm extends StatelessWidget {
  const MenuForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MenuBloc>(
      create: (BuildContext context) => MenuBloc(
        getMenuListUsecase: appLocator.get<GetMenuListUseCase>(),
      ),
      child: BlocBuilder<MenuBloc, MenuState>(
        builder: (BuildContext context, MenuState state) {
          if (state.error != null) {}
          if (!state.isLoading) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    RestaurantHeader(),
                    RestaurantPropertiesWidget(),
                    HorizontalFoodList(),
                    ScrollableFoodMenu(),
                    VerticalMenuList(state.dishesList),

                  ],
                ),
              )
            );
          }
          return Center(
              child: CircularProgressIndicator(
                valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
              ));
        },
      ),
    );
  }
}











// import 'package:navigation/navigation.dart';
// import 'package:flutter/material.dart';
// import 'package:menu/ui/widget/widgets.dart';
/*
class MenuForm extends StatelessWidget {
  const MenuForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  RestaurantHeader(),
                  RestaurantPropertiesWidget(),
                  HorizontalFoodList(),
                  ScrollableFoodMenu(),
                  VerticalFoodList(),
                  VerticalFoodList(),
                ],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: AppColors.orange,
      //   unselectedItemColor: AppColors.grey,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       activeIcon: Icon(
      //         Icons.local_dining_outlined,
      //         color: AppColors.orange,
      //       ),
      //       icon: Icon(
      //         Icons.local_dining_outlined,
      //         color: AppColors.grey,
      //       ),
      //       label: AppConstants.labelHome,
      //     ),
      //     BottomNavigationBarItem(
      //       activeIcon: Icon(
      //         Icons.search_off_outlined,
      //         color: AppColors.orange,
      //       ),
      //       icon: Icon(
      //         Icons.search_outlined,
      //         color: AppColors.grey,
      //       ),
      //       label: AppConstants.labelSearch,
      //     ),
      //     BottomNavigationBarItem(
      //       activeIcon: Icon(
      //         Icons.book_outlined,
      //         color: AppColors.orange,
      //       ),
      //       icon: Icon(
      //         Icons.book_outlined,
      //         color: AppColors.grey,
      //       ),
      //       label: AppConstants.labelOrders,
      //     ),
      //     BottomNavigationBarItem(
      //       activeIcon: Icon(
      //         Icons.emoji_people_outlined,
      //         color: AppColors.orange,
      //       ),
      //       icon: Icon(
      //         Icons.emoji_people_outlined,
      //         color: AppColors.grey,
      //       ),
      //       label: AppConstants.labelProfile,
      //     )
      //   ],
      // ),
    );
  }
}
*/
