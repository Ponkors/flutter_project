import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'menu_item.dart';

class VerticalMenuList extends StatefulWidget {
  final List<MenuItemEntity> _itemModels;
  const VerticalMenuList(this._itemModels, {super.key});

  @override
  State<StatefulWidget> createState() => _VerticalMenuListState();
}

class _VerticalMenuListState extends State<VerticalMenuList> {
  @override
  Widget build (BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(AppDimens.padding_20),
      child: SingleChildScrollView(
        child: Column(
          children: widget._itemModels.asMap().entries.map((entry) {
            int index = entry.key;
            MenuItemEntity itemModel = entry.value;
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).push(
                      DishRoute(model: itemModel),
                    );
                  },
                  child: MenuItem(
                    name: itemModel.name,
                    ingredients: itemModel.ingredients,
                    image: itemModel.image,
                    cost: itemModel.cost,
                  ),
                ),
                if (index != widget._itemModels.length - 1)
                  const Divider(height: AppDimens.padding_10),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}



// import 'package:core_ui/core_ui.dart';
// import 'package:menu/ui/widget/vertical_food_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
//
// class VerticalFoodList extends StatefulWidget {
//   List<Widget> foods = [
//     VerticalFoodWidget(
//       imagePath: ImagePaths.foodImage,
//       foodName: 'ComboBurger',
//       foodContains: 'Shortbread, chocolate turtle cookies, and red velvet.',
//       price: 'AUD \$10',
//     ),
//     VerticalFoodWidget(
//       imagePath: ImagePaths.foodImage,
//       foodName: 'ComboBurger',
//       foodContains: 'Shortbread, chocolate turtle cookies, and red velvet.',
//       price: 'AUD \$10',
//     ),
//     VerticalFoodWidget(
//       imagePath: ImagePaths.foodImage,
//       foodName: 'ComboBurger',
//       foodContains: 'Shortbread, chocolate turtle cookies, and red velvet.',
//       price: 'AUD \$10',
//     ),
//   ];
//
//   @override
//   _VerticalFoodListState createState() => _VerticalFoodListState();
// }
//
// class _VerticalFoodListState extends State<VerticalFoodList> {
//   int selectedCategoryIndex = -1;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       margin: EdgeInsets.only(left: 20, right: 20),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: EdgeInsets.only(top: 20),
//               child: Text(
//                 'Most Populars',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w300,
//                 ),
//               ),
//             ),
//             ListView(
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               children: widget.foods.map((food) => food).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
