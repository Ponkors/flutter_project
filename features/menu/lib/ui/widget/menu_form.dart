import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu/bloc/menu_bloc.dart';
import 'package:menu/ui/widget/food_menu_widget.dart';
import 'package:menu/ui/widget/header.dart';
import 'package:menu/ui/widget/horizontal_menu_list.dart';
import 'package:menu/ui/widget/properties.dart';
import 'package:menu/ui/widget/vertical_food_list.dart';

import 'menu_list.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';

class MenuForm extends StatelessWidget {
  const MenuForm({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MenuBloc>(
          create: (BuildContext context) => MenuBloc(
            getMenuListUsecase: appLocator.get<GetMenuListUseCase>(),
          ),
        ),
        BlocProvider<HorizontalMenuBloc>(
          create: (BuildContext context) => HorizontalMenuBloc(
            getHorizontalMenuListUseCase: appLocator.get<GetHorizontalMenuListUseCase>(),
          ),
        ),
      ],
      child: BlocBuilder<MenuBloc, MenuState>(
        builder: (BuildContext menuContext, MenuState menuState) {
          return BlocBuilder<HorizontalMenuBloc, HorizontalMenuState>(
            builder: (BuildContext horizontalMenuContext, HorizontalMenuState horizontalMenuState) {
              if (menuState.error != null) {}
              if (!menuState.isLoading) {
                return Scaffold(
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        RestaurantHeader(),
                        RestaurantPropertiesWidget(),
                        HorizontalMenuList(horizontalMenuState.dishesList),
                        ScrollableFoodMenu(),
                        VerticalMenuList(menuState.dishesList),
                      ],
                    ),
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                /*
                Or use iOS activity indicator (also can add a algorithm that
                check,  if we use an Android platform = CircularProgressIndicator,
                        if we use an iOS platform = CupertinoActivityIndicator

                child:CupertinoActivityIndicator(
                  radius: 16,
                  color: Theme.of(context).primaryColor)
                  */
                ),
              );
            },
          );
        },
      ),
    );
  }
}



/*
import 'package:flutter/material.dart';
import 'package:menu/bloc/menu_bloc.dart';
import 'package:menu/ui/widget/food_menu_widget.dart';
import 'package:menu/ui/widget/header.dart';
import 'package:menu/ui/widget/horizontal_menu_list.dart';
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
                    HorizontalMenuList(state.dishesList),
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


 */










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
