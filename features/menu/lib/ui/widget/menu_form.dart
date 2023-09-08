import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu/bloc/menu_bloc.dart';
import 'package:menu/ui/widget/food_menu_widget.dart';
import 'package:menu/ui/widget/header.dart';
import 'package:menu/ui/widget/horizontal_menu_list.dart';
import 'package:menu/ui/widget/properties.dart';
import 'package:menu/ui/widget/vertical_food_list.dart';

import 'package:core/core.dart';
import 'package:domain/domain.dart';

class MenuForm extends StatelessWidget {
  const MenuForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MenuBloc>(
        create: (BuildContext context) => MenuBloc(
          getMenuListUseCase: appLocator.get<GetMenuListUseCase>(),
          getHeaderMenuListUseCase: appLocator.get<GetHeaderMenuListUseCase>(),
          getHorizontalMenuListUseCase: appLocator.get<GetHorizontalMenuListUseCase>(),
        ),
        child: BlocBuilder<MenuBloc, MenuState>(
          builder: (BuildContext menuContext, MenuState menuState) {
            if (menuState.error != null) {}
            if (!menuState.isLoading) {
              return Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      RestaurantHeader(menuState.headerImagesList),
                      RestaurantPropertiesWidget(),
                      HorizontalMenuList(menuState.horizontalDishesList),
                      ScrollableFoodMenu(),
                      VerticalMenuList(menuState.dishesList),
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child:CupertinoActivityIndicator(
                radius: AppDimens.radius_16,
                color: AppColors.grey,
              ),
          );
        },
      ),
    );
  }
}

