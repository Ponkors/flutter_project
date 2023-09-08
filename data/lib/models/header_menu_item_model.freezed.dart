// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'header_menu_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HeaderMenuItemModel _$HeaderMenuItemModelFromJson(Map<String, dynamic> json) {
  return _HeaderMenuItemModel.fromJson(json);
}

/// @nodoc
mixin _$HeaderMenuItemModel {
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HeaderMenuItemModelCopyWith<HeaderMenuItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeaderMenuItemModelCopyWith<$Res> {
  factory $HeaderMenuItemModelCopyWith(
          HeaderMenuItemModel value, $Res Function(HeaderMenuItemModel) then) =
      _$HeaderMenuItemModelCopyWithImpl<$Res, HeaderMenuItemModel>;
  @useResult
  $Res call({String image});
}

/// @nodoc
class _$HeaderMenuItemModelCopyWithImpl<$Res, $Val extends HeaderMenuItemModel>
    implements $HeaderMenuItemModelCopyWith<$Res> {
  _$HeaderMenuItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HeaderMenuItemModelCopyWith<$Res>
    implements $HeaderMenuItemModelCopyWith<$Res> {
  factory _$$_HeaderMenuItemModelCopyWith(_$_HeaderMenuItemModel value,
          $Res Function(_$_HeaderMenuItemModel) then) =
      __$$_HeaderMenuItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String image});
}

/// @nodoc
class __$$_HeaderMenuItemModelCopyWithImpl<$Res>
    extends _$HeaderMenuItemModelCopyWithImpl<$Res, _$_HeaderMenuItemModel>
    implements _$$_HeaderMenuItemModelCopyWith<$Res> {
  __$$_HeaderMenuItemModelCopyWithImpl(_$_HeaderMenuItemModel _value,
      $Res Function(_$_HeaderMenuItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_$_HeaderMenuItemModel(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HeaderMenuItemModel implements _HeaderMenuItemModel {
  _$_HeaderMenuItemModel({required this.image});

  factory _$_HeaderMenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_HeaderMenuItemModelFromJson(json);

  @override
  final String image;

  @override
  String toString() {
    return 'HeaderMenuItemModel(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HeaderMenuItemModel &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HeaderMenuItemModelCopyWith<_$_HeaderMenuItemModel> get copyWith =>
      __$$_HeaderMenuItemModelCopyWithImpl<_$_HeaderMenuItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HeaderMenuItemModelToJson(
      this,
    );
  }
}

abstract class _HeaderMenuItemModel implements HeaderMenuItemModel {
  factory _HeaderMenuItemModel({required final String image}) =
      _$_HeaderMenuItemModel;

  factory _HeaderMenuItemModel.fromJson(Map<String, dynamic> json) =
      _$_HeaderMenuItemModel.fromJson;

  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_HeaderMenuItemModelCopyWith<_$_HeaderMenuItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
