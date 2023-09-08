import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class MainForm extends StatelessWidget {
  const MainForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        routes: const <PageRouteInfo>[
          MenuRoute(),
          SearchRoute(),
          OrdersRoute(),
          ProfileRoute(),
        ],
        animationDuration: Duration.zero,
        bottomNavigationBuilder: (BuildContext context, TabsRouter router) {
          return BottomNavigationBar(
            currentIndex: router.activeIndex,
            onTap: router.setActiveIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.orange,
            unselectedItemColor: AppColors.grey,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                activeIcon: Icon(
                    Icons.local_dining_outlined,
                    color: AppColors.orange,
                ),
                icon: Icon(
                  Icons.local_dining_outlined,
                  color: AppColors.grey,
                ),
                label: AppConstants.labelHome,
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                    Icons.search_outlined,
                    color: AppColors.orange,
                ),
                icon: Icon(
                  Icons.search_outlined,
                  color: AppColors.grey,
                ),
                label: AppConstants.labelSearch,
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                    Icons.book_outlined,
                    color: AppColors.orange,
                ),
                icon: Icon(
                  Icons.book_outlined,
                  color: AppColors.grey,
                ),
                label: AppConstants.labelOrders,
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                    Icons.emoji_people_outlined,
                    color: AppColors.orange,
                ),
                icon: Icon(
                  Icons.emoji_people_outlined,
                  color: AppColors.grey,
                ),
                label: AppConstants.labelProfile,
              ),
            ],
          );
        }
    );
  }
}
