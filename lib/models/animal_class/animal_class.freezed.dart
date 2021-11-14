// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'animal_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnimalClass _$AnimalClassFromJson(Map<String, dynamic> json) {
  return _AnimalClass.fromJson(json);
}

/// @nodoc
class _$AnimalClassTearOff {
  const _$AnimalClassTearOff();

  _AnimalClass call(
      {int? id, String? className, String? phylumName, bool? isActive}) {
    return _AnimalClass(
      id: id,
      className: className,
      phylumName: phylumName,
      isActive: isActive,
    );
  }

  AnimalClass fromJson(Map<String, Object> json) {
    return AnimalClass.fromJson(json);
  }
}

/// @nodoc
const $AnimalClass = _$AnimalClassTearOff();

/// @nodoc
mixin _$AnimalClass {
  int? get id => throw _privateConstructorUsedError;
  String? get className => throw _privateConstructorUsedError;
  String? get phylumName => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnimalClassCopyWith<AnimalClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimalClassCopyWith<$Res> {
  factory $AnimalClassCopyWith(
          AnimalClass value, $Res Function(AnimalClass) then) =
      _$AnimalClassCopyWithImpl<$Res>;
  $Res call({int? id, String? className, String? phylumName, bool? isActive});
}

/// @nodoc
class _$AnimalClassCopyWithImpl<$Res> implements $AnimalClassCopyWith<$Res> {
  _$AnimalClassCopyWithImpl(this._value, this._then);

  final AnimalClass _value;
  // ignore: unused_field
  final $Res Function(AnimalClass) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? className = freezed,
    Object? phylumName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      className: className == freezed
          ? _value.className
          : className // ignore: cast_nullable_to_non_nullable
              as String?,
      phylumName: phylumName == freezed
          ? _value.phylumName
          : phylumName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$AnimalClassCopyWith<$Res>
    implements $AnimalClassCopyWith<$Res> {
  factory _$AnimalClassCopyWith(
          _AnimalClass value, $Res Function(_AnimalClass) then) =
      __$AnimalClassCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? className, String? phylumName, bool? isActive});
}

/// @nodoc
class __$AnimalClassCopyWithImpl<$Res> extends _$AnimalClassCopyWithImpl<$Res>
    implements _$AnimalClassCopyWith<$Res> {
  __$AnimalClassCopyWithImpl(
      _AnimalClass _value, $Res Function(_AnimalClass) _then)
      : super(_value, (v) => _then(v as _AnimalClass));

  @override
  _AnimalClass get _value => super._value as _AnimalClass;

  @override
  $Res call({
    Object? id = freezed,
    Object? className = freezed,
    Object? phylumName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_AnimalClass(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      className: className == freezed
          ? _value.className
          : className // ignore: cast_nullable_to_non_nullable
              as String?,
      phylumName: phylumName == freezed
          ? _value.phylumName
          : phylumName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnimalClass implements _AnimalClass {
  const _$_AnimalClass(
      {this.id, this.className, this.phylumName, this.isActive});

  factory _$_AnimalClass.fromJson(Map<String, dynamic> json) =>
      _$$_AnimalClassFromJson(json);

  @override
  final int? id;
  @override
  final String? className;
  @override
  final String? phylumName;
  @override
  final bool? isActive;

  @override
  String toString() {
    return 'AnimalClass(id: $id, className: $className, phylumName: $phylumName, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AnimalClass &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.className, className) ||
                const DeepCollectionEquality()
                    .equals(other.className, className)) &&
            (identical(other.phylumName, phylumName) ||
                const DeepCollectionEquality()
                    .equals(other.phylumName, phylumName)) &&
            (identical(other.isActive, isActive) ||
                const DeepCollectionEquality()
                    .equals(other.isActive, isActive)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(className) ^
      const DeepCollectionEquality().hash(phylumName) ^
      const DeepCollectionEquality().hash(isActive);

  @JsonKey(ignore: true)
  @override
  _$AnimalClassCopyWith<_AnimalClass> get copyWith =>
      __$AnimalClassCopyWithImpl<_AnimalClass>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnimalClassToJson(this);
  }
}

abstract class _AnimalClass implements AnimalClass {
  const factory _AnimalClass(
      {int? id,
      String? className,
      String? phylumName,
      bool? isActive}) = _$_AnimalClass;

  factory _AnimalClass.fromJson(Map<String, dynamic> json) =
      _$_AnimalClass.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get className => throw _privateConstructorUsedError;
  @override
  String? get phylumName => throw _privateConstructorUsedError;
  @override
  bool? get isActive => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AnimalClassCopyWith<_AnimalClass> get copyWith =>
      throw _privateConstructorUsedError;
}
