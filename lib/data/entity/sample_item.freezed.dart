// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sample_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SampleItem {
  String get name => throw _privateConstructorUsedError;
  bool get isFavorited => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SampleItemCopyWith<SampleItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SampleItemCopyWith<$Res> {
  factory $SampleItemCopyWith(
          SampleItem value, $Res Function(SampleItem) then) =
      _$SampleItemCopyWithImpl<$Res, SampleItem>;
  @useResult
  $Res call({String name, bool isFavorited});
}

/// @nodoc
class _$SampleItemCopyWithImpl<$Res, $Val extends SampleItem>
    implements $SampleItemCopyWith<$Res> {
  _$SampleItemCopyWithImpl(this._value, this._then);

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
abstract class _$$_SampleItemCopyWith<$Res>
    implements $SampleItemCopyWith<$Res> {
  factory _$$_SampleItemCopyWith(
          _$_SampleItem value, $Res Function(_$_SampleItem) then) =
      __$$_SampleItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, bool isFavorited});
}

/// @nodoc
class __$$_SampleItemCopyWithImpl<$Res>
    extends _$SampleItemCopyWithImpl<$Res, _$_SampleItem>
    implements _$$_SampleItemCopyWith<$Res> {
  __$$_SampleItemCopyWithImpl(
      _$_SampleItem _value, $Res Function(_$_SampleItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isFavorited = null,
  }) {
    return _then(_$_SampleItem(
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

class _$_SampleItem implements _SampleItem {
  const _$_SampleItem({required this.name, required this.isFavorited});

  @override
  final String name;
  @override
  final bool isFavorited;

  @override
  String toString() {
    return 'SampleItem(name: $name, isFavorited: $isFavorited)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SampleItem &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isFavorited, isFavorited) ||
                other.isFavorited == isFavorited));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, isFavorited);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SampleItemCopyWith<_$_SampleItem> get copyWith =>
      __$$_SampleItemCopyWithImpl<_$_SampleItem>(this, _$identity);
}

abstract class _SampleItem implements SampleItem {
  const factory _SampleItem(
      {required final String name,
      required final bool isFavorited}) = _$_SampleItem;

  @override
  String get name;
  @override
  bool get isFavorited;
  @override
  @JsonKey(ignore: true)
  _$$_SampleItemCopyWith<_$_SampleItem> get copyWith =>
      throw _privateConstructorUsedError;
}
