// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'horizontal_menu_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HorizontalMenuItemModel _$HorizontalMenuItemModelFromJson(
    Map<String, dynamic> json) {
  return _HorizontalMenuItemModel.fromJson(json);
}

/// @nodoc
mixin _$HorizontalMenuItemModel {
  String get image => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get ingredients => throw _privateConstructorUsedError;
  String get details => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HorizontalMenuItemModelCopyWith<HorizontalMenuItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HorizontalMenuItemModelCopyWith<$Res> {
  factory $HorizontalMenuItemModelCopyWith(HorizontalMenuItemModel value,
          $Res Function(HorizontalMenuItemModel) then) =
      _$HorizontalMenuItemModelCopyWithImpl<$Res, HorizontalMenuItemModel>;
  @useResult
  $Res call(
      {String image,
      String name,
      String type,
      String ingredients,
      String details,
      double cost});
}

/// @nodoc
class _$HorizontalMenuItemModelCopyWithImpl<$Res,
        $Val extends HorizontalMenuItemModel>
    implements $HorizontalMenuItemModelCopyWith<$Res> {
  _$HorizontalMenuItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? name = null,
    Object? type = null,
    Object? ingredients = null,
    Object? details = null,
    Object? cost = null,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HorizontalMenuItemModelCopyWith<$Res>
    implements $HorizontalMenuItemModelCopyWith<$Res> {
  factory _$$_HorizontalMenuItemModelCopyWith(_$_HorizontalMenuItemModel value,
          $Res Function(_$_HorizontalMenuItemModel) then) =
      __$$_HorizontalMenuItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String image,
      String name,
      String type,
      String ingredients,
      String details,
      double cost});
}

/// @nodoc
class __$$_HorizontalMenuItemModelCopyWithImpl<$Res>
    extends _$HorizontalMenuItemModelCopyWithImpl<$Res,
        _$_HorizontalMenuItemModel>
    implements _$$_HorizontalMenuItemModelCopyWith<$Res> {
  __$$_HorizontalMenuItemModelCopyWithImpl(_$_HorizontalMenuItemModel _value,
      $Res Function(_$_HorizontalMenuItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? name = null,
    Object? type = null,
    Object? ingredients = null,
    Object? details = null,
    Object? cost = null,
  }) {
    return _then(_$_HorizontalMenuItemModel(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HorizontalMenuItemModel implements _HorizontalMenuItemModel {
  _$_HorizontalMenuItemModel(
      {required this.image,
      required this.name,
      required this.type,
      required this.ingredients,
      required this.details,
      required this.cost});

  factory _$_HorizontalMenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_HorizontalMenuItemModelFromJson(json);

  @override
  final String image;
  @override
  final String name;
  @override
  final String type;
  @override
  final String ingredients;
  @override
  final String details;
  @override
  final double cost;

  @override
  String toString() {
    return 'HorizontalMenuItemModel(image: $image, name: $name, type: $type, ingredients: $ingredients, details: $details, cost: $cost)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HorizontalMenuItemModel &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.ingredients, ingredients) ||
                other.ingredients == ingredients) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.cost, cost) || other.cost == cost));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, image, name, type, ingredients, details, cost);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HorizontalMenuItemModelCopyWith<_$_HorizontalMenuItemModel>
      get copyWith =>
          __$$_HorizontalMenuItemModelCopyWithImpl<_$_HorizontalMenuItemModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HorizontalMenuItemModelToJson(
      this,
    );
  }
}

abstract class _HorizontalMenuItemModel implements HorizontalMenuItemModel {
  factory _HorizontalMenuItemModel(
      {required final String image,
      required final String name,
      required final String type,
      required final String ingredients,
      required final String details,
      required final double cost}) = _$_HorizontalMenuItemModel;

  factory _HorizontalMenuItemModel.fromJson(Map<String, dynamic> json) =
      _$_HorizontalMenuItemModel.fromJson;

  @override
  String get image;
  @override
  String get name;
  @override
  String get type;
  @override
  String get ingredients;
  @override
  String get details;
  @override
  double get cost;
  @override
  @JsonKey(ignore: true)
  _$$_HorizontalMenuItemModelCopyWith<_$_HorizontalMenuItemModel>
      get copyWith => throw _privateConstructorUsedError;
}
