// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coordinate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Coordinate _$CoordinateFromJson(Map<String, dynamic> json) {
  return _Coordinate.fromJson(json);
}

/// @nodoc
mixin _$Coordinate {
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'local_names')
  LocalName? get localName => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lon => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoordinateCopyWith<Coordinate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoordinateCopyWith<$Res> {
  factory $CoordinateCopyWith(
          Coordinate value, $Res Function(Coordinate) then) =
      _$CoordinateCopyWithImpl<$Res, Coordinate>;
  @useResult
  $Res call(
      {String? name,
      @JsonKey(name: 'local_names') LocalName? localName,
      double? lat,
      double? lon,
      String? country});

  $LocalNameCopyWith<$Res>? get localName;
}

/// @nodoc
class _$CoordinateCopyWithImpl<$Res, $Val extends Coordinate>
    implements $CoordinateCopyWith<$Res> {
  _$CoordinateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? localName = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? country = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      localName: freezed == localName
          ? _value.localName
          : localName // ignore: cast_nullable_to_non_nullable
              as LocalName?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocalNameCopyWith<$Res>? get localName {
    if (_value.localName == null) {
      return null;
    }

    return $LocalNameCopyWith<$Res>(_value.localName!, (value) {
      return _then(_value.copyWith(localName: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CoordinateCopyWith<$Res>
    implements $CoordinateCopyWith<$Res> {
  factory _$$_CoordinateCopyWith(
          _$_Coordinate value, $Res Function(_$_Coordinate) then) =
      __$$_CoordinateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      @JsonKey(name: 'local_names') LocalName? localName,
      double? lat,
      double? lon,
      String? country});

  @override
  $LocalNameCopyWith<$Res>? get localName;
}

/// @nodoc
class __$$_CoordinateCopyWithImpl<$Res>
    extends _$CoordinateCopyWithImpl<$Res, _$_Coordinate>
    implements _$$_CoordinateCopyWith<$Res> {
  __$$_CoordinateCopyWithImpl(
      _$_Coordinate _value, $Res Function(_$_Coordinate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? localName = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? country = freezed,
  }) {
    return _then(_$_Coordinate(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      localName: freezed == localName
          ? _value.localName
          : localName // ignore: cast_nullable_to_non_nullable
              as LocalName?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Coordinate implements _Coordinate {
  const _$_Coordinate(
      {this.name,
      @JsonKey(name: 'local_names') this.localName,
      this.lat,
      this.lon,
      this.country});

  factory _$_Coordinate.fromJson(Map<String, dynamic> json) =>
      _$$_CoordinateFromJson(json);

  @override
  final String? name;
  @override
  @JsonKey(name: 'local_names')
  final LocalName? localName;
  @override
  final double? lat;
  @override
  final double? lon;
  @override
  final String? country;

  @override
  String toString() {
    return 'Coordinate(name: $name, localName: $localName, lat: $lat, lon: $lon, country: $country)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Coordinate &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.localName, localName) ||
                other.localName == localName) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, localName, lat, lon, country);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CoordinateCopyWith<_$_Coordinate> get copyWith =>
      __$$_CoordinateCopyWithImpl<_$_Coordinate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoordinateToJson(
      this,
    );
  }
}

abstract class _Coordinate implements Coordinate {
  const factory _Coordinate(
      {final String? name,
      @JsonKey(name: 'local_names') final LocalName? localName,
      final double? lat,
      final double? lon,
      final String? country}) = _$_Coordinate;

  factory _Coordinate.fromJson(Map<String, dynamic> json) =
      _$_Coordinate.fromJson;

  @override
  String? get name;
  @override
  @JsonKey(name: 'local_names')
  LocalName? get localName;
  @override
  double? get lat;
  @override
  double? get lon;
  @override
  String? get country;
  @override
  @JsonKey(ignore: true)
  _$$_CoordinateCopyWith<_$_Coordinate> get copyWith =>
      throw _privateConstructorUsedError;
}

LocalName _$LocalNameFromJson(Map<String, dynamic> json) {
  return _LocalName.fromJson(json);
}

/// @nodoc
mixin _$LocalName {
  String? get en => throw _privateConstructorUsedError;
  String? get vi => throw _privateConstructorUsedError;
  String? get ko => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalNameCopyWith<LocalName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalNameCopyWith<$Res> {
  factory $LocalNameCopyWith(LocalName value, $Res Function(LocalName) then) =
      _$LocalNameCopyWithImpl<$Res, LocalName>;
  @useResult
  $Res call({String? en, String? vi, String? ko});
}

/// @nodoc
class _$LocalNameCopyWithImpl<$Res, $Val extends LocalName>
    implements $LocalNameCopyWith<$Res> {
  _$LocalNameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? en = freezed,
    Object? vi = freezed,
    Object? ko = freezed,
  }) {
    return _then(_value.copyWith(
      en: freezed == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String?,
      vi: freezed == vi
          ? _value.vi
          : vi // ignore: cast_nullable_to_non_nullable
              as String?,
      ko: freezed == ko
          ? _value.ko
          : ko // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocalNameCopyWith<$Res> implements $LocalNameCopyWith<$Res> {
  factory _$$_LocalNameCopyWith(
          _$_LocalName value, $Res Function(_$_LocalName) then) =
      __$$_LocalNameCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? en, String? vi, String? ko});
}

/// @nodoc
class __$$_LocalNameCopyWithImpl<$Res>
    extends _$LocalNameCopyWithImpl<$Res, _$_LocalName>
    implements _$$_LocalNameCopyWith<$Res> {
  __$$_LocalNameCopyWithImpl(
      _$_LocalName _value, $Res Function(_$_LocalName) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? en = freezed,
    Object? vi = freezed,
    Object? ko = freezed,
  }) {
    return _then(_$_LocalName(
      en: freezed == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String?,
      vi: freezed == vi
          ? _value.vi
          : vi // ignore: cast_nullable_to_non_nullable
              as String?,
      ko: freezed == ko
          ? _value.ko
          : ko // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocalName implements _LocalName {
  const _$_LocalName({this.en, this.vi, this.ko});

  factory _$_LocalName.fromJson(Map<String, dynamic> json) =>
      _$$_LocalNameFromJson(json);

  @override
  final String? en;
  @override
  final String? vi;
  @override
  final String? ko;

  @override
  String toString() {
    return 'LocalName(en: $en, vi: $vi, ko: $ko)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalName &&
            (identical(other.en, en) || other.en == en) &&
            (identical(other.vi, vi) || other.vi == vi) &&
            (identical(other.ko, ko) || other.ko == ko));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, en, vi, ko);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocalNameCopyWith<_$_LocalName> get copyWith =>
      __$$_LocalNameCopyWithImpl<_$_LocalName>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocalNameToJson(
      this,
    );
  }
}

abstract class _LocalName implements LocalName {
  const factory _LocalName(
      {final String? en, final String? vi, final String? ko}) = _$_LocalName;

  factory _LocalName.fromJson(Map<String, dynamic> json) =
      _$_LocalName.fromJson;

  @override
  String? get en;
  @override
  String? get vi;
  @override
  String? get ko;
  @override
  @JsonKey(ignore: true)
  _$$_LocalNameCopyWith<_$_LocalName> get copyWith =>
      throw _privateConstructorUsedError;
}
