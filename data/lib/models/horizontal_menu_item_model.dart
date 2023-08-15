import 'package:freezed_annotation/freezed_annotation.dart';

part 'horizontal_menu_item_model.freezed.dart';
part 'horizontal_menu_item_model.g.dart';

@freezed
class HorizontalMenuItemModel with _$HorizontalMenuItemModel {
  factory HorizontalMenuItemModel({
    required String image,
    required String name,
    required String type,
    required String ingredients,
    required String details,
    required double cost,
  }) = _HorizontalMenuItemModel;

  factory HorizontalMenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$HorizontalMenuItemModelFromJson(json);
}
