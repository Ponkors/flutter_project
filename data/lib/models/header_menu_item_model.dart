import 'package:freezed_annotation/freezed_annotation.dart';

part 'header_menu_item_model.freezed.dart';
part 'header_menu_item_model.g.dart';

@freezed
class HeaderMenuItemModel with _$HeaderMenuItemModel {
  factory HeaderMenuItemModel({
    required String image,
  }) = _HeaderMenuItemModel;

  factory HeaderMenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$HeaderMenuItemModelFromJson(json);
}
