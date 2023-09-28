import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:menu/menu.dart';
import 'package:orders/bloc/cart_bloc.dart';
import 'package:settings/settings.dart';

class SelectDishScreen extends StatelessWidget {
  final DishModel dish;

  const SelectDishScreen({
    required this.dish,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final CartBloc cartBloc = BlocProvider.of<CartBloc>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(dish.title),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimens.padding_20),
          child: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (_, SettingsState state) {
              return Card(
                shadowColor: AppColors.grey,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppDimens.radius_16),
                  ),
                ),
                elevation: 5,
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Hero(
                        tag: dish.imageURL,
                        child: Container(
                          width: AppDimens.size_350,
                          height: AppDimens.size_350,
                          child: CacheAppImage(
                            imageURL: dish.imageURL,
                            height: mediaQueryData.size.height * 0.3,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppDimens.size_10,
                    ),
                    ListTile(
                      title: Text(
                        dish.title,
                        style: GoogleFonts.poppins(
                          textStyle: AppFonts.s28_w700,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'selectDishScreen.ingredients'.tr(),
                        style: GoogleFonts.poppins(
                          textStyle: AppFonts.normal_18_bold,
                          color: themeData.primaryColor,
                        ),
                      ),
                      subtitle: IngredientsListDish(
                        ingredientsList: dish.ingredients,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'selectDishScreen.description'.tr(),
                        style: GoogleFonts.poppins(
                          textStyle: AppFonts.normal_18_bold,
                          color: themeData.primaryColor,
                        ),
                      ),
                      subtitle: RichText(
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                            textStyle: AppFonts.normal_18,
                            color: AppColors.grey,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: '${dish.description}',
                            ),
                          ],
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        '${'selectDishScreen.cost'.tr()} \$${dish.cost}',
                        style: GoogleFonts.poppins(
                          textStyle: AppFonts.normal_18_bold,
                          color: themeData.primaryColor,
                        ),
                      ),
                    ),
                    AddButton(
                      onPressed: () {
                        cartBloc.add(
                          AddDishToCart(dish: dish),
                        );
                        final SnackBar snackBar = SnackBar(
                          content: Text(
                            'menuScreen.dishAddedToTheCart'.tr(),
                            style: GoogleFonts.poppins(
                              textStyle: AppFonts.normal_18,
                            ),
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: themeData.primaryColor,
                          duration: const Duration(seconds: 1),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                    ),
                    const SizedBox(height: AppDimens.size_5),
                  ],
                ),
              );
            },
          )
        ),
      ),
    );
  }
}
