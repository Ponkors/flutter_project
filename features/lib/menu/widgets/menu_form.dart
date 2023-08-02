import 'package:core_ui/core_ui.dart';
import 'package:core_ui/design/app_colors.dart';
import 'package:navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:features/menu/widgets/header.dart';
import 'package:features/menu/widgets/properties.dart';
import 'package:features/menu/widgets/horizontal_food_list.dart';
import 'package:features/menu/widgets/food_menu_widget.dart';
import 'package:features/menu/widgets/vertical_food_list.dart';

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
