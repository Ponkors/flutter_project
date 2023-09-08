// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horizontal_menu_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HorizontalMenuItemModel _$$_HorizontalMenuItemModelFromJson(
        Map<String, dynamic> json) =>
    _$_HorizontalMenuItemModel(
      image: json['image'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      ingredients: json['ingredients'] as String,
      details: json['details'] as String,
      cost: (json['cost'] as num).toDouble(),
    );

Map<String, dynamic> _$$_HorizontalMenuItemModelToJson(
        _$_HorizontalMenuItemModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'type': instance.type,
      'ingredients': instance.ingredients,
      'details': instance.details,
      'cost': instance.cost,
    };
