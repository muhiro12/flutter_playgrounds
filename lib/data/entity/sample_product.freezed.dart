// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sample_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SampleProduct {
  String get name => throw _privateConstructorUsedError;
  bool get isFavorited => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SampleProductCopyWith<SampleProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SampleProductCopyWith<$Res> {
  factory $SampleProductCopyWith(
          SampleProduct value, $Res Function(SampleProduct) then) =
      _$SampleProductCopyWithImpl<$Res, SampleProduct>;
  @useResult
  $Res call({String name, bool isFavorited});
}

/// @nodoc
class _$SampleProductCopyWithImpl<$Res, $Val extends SampleProduct>
    implements $SampleProductCopyWith<$Res> {
  _$SampleProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isFavorited = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorited: null == isFavorited
          ? _value.isFavorited
          : isFavorited // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SampleProductCopyWith<$Res>
    implements $SampleProductCopyWith<$Res> {
  factory _$$_SampleProductCopyWith(
          _$_SampleProduct value, $Res Function(_$_SampleProduct) then) =
      __$$_SampleProductCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, bool isFavorited});
}

/// @nodoc
class __$$_SampleProductCopyWithImpl<$Res>
    extends _$SampleProductCopyWithImpl<$Res, _$_SampleProduct>
    implements _$$_SampleProductCopyWith<$Res> {
  __$$_SampleProductCopyWithImpl(
      _$_SampleProduct _value, $Res Function(_$_SampleProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isFavorited = null,
  }) {
    return _then(_$_SampleProduct(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorited: null == isFavorited
          ? _value.isFavorited
          : isFavorited // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SampleProduct implements _SampleProduct {
  const _$_SampleProduct({required this.name, required this.isFavorited});

  @override
  final String name;
  @override
  final bool isFavorited;

  @override
  String toString() {
    return 'SampleProduct(name: $name, isFavorited: $isFavorited)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SampleProduct &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isFavorited, isFavorited) ||
                other.isFavorited == isFavorited));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, isFavorited);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SampleProductCopyWith<_$_SampleProduct> get copyWith =>
      __$$_SampleProductCopyWithImpl<_$_SampleProduct>(this, _$identity);
}

abstract class _SampleProduct implements SampleProduct {
  const factory _SampleProduct(
      {required final String name,
      required final bool isFavorited}) = _$_SampleProduct;

  @override
  String get name;
  @override
  bool get isFavorited;
  @override
  @JsonKey(ignore: true)
  _$$_SampleProductCopyWith<_$_SampleProduct> get copyWith =>
      throw _privateConstructorUsedError;
}
