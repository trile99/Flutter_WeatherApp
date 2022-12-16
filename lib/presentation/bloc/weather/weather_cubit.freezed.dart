// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeatherState {
  LoadingStatus? get loadingStatus => throw _privateConstructorUsedError;
  List<Coordinate>? get coordinate => throw _privateConstructorUsedError;
  Weather? get weather => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherStateCopyWith<WeatherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
          WeatherState value, $Res Function(WeatherState) then) =
      _$WeatherStateCopyWithImpl<$Res, WeatherState>;
  @useResult
  $Res call(
      {LoadingStatus? loadingStatus,
      List<Coordinate>? coordinate,
      Weather? weather});

  $WeatherCopyWith<$Res>? get weather;
}

/// @nodoc
class _$WeatherStateCopyWithImpl<$Res, $Val extends WeatherState>
    implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingStatus = freezed,
    Object? coordinate = freezed,
    Object? weather = freezed,
  }) {
    return _then(_value.copyWith(
      loadingStatus: freezed == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus?,
      coordinate: freezed == coordinate
          ? _value.coordinate
          : coordinate // ignore: cast_nullable_to_non_nullable
              as List<Coordinate>?,
      weather: freezed == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherCopyWith<$Res>? get weather {
    if (_value.weather == null) {
      return null;
    }

    return $WeatherCopyWith<$Res>(_value.weather!, (value) {
      return _then(_value.copyWith(weather: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WeatherStateCopyWith<$Res>
    implements $WeatherStateCopyWith<$Res> {
  factory _$$_WeatherStateCopyWith(
          _$_WeatherState value, $Res Function(_$_WeatherState) then) =
      __$$_WeatherStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadingStatus? loadingStatus,
      List<Coordinate>? coordinate,
      Weather? weather});

  @override
  $WeatherCopyWith<$Res>? get weather;
}

/// @nodoc
class __$$_WeatherStateCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$_WeatherState>
    implements _$$_WeatherStateCopyWith<$Res> {
  __$$_WeatherStateCopyWithImpl(
      _$_WeatherState _value, $Res Function(_$_WeatherState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingStatus = freezed,
    Object? coordinate = freezed,
    Object? weather = freezed,
  }) {
    return _then(_$_WeatherState(
      loadingStatus: freezed == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus?,
      coordinate: freezed == coordinate
          ? _value._coordinate
          : coordinate // ignore: cast_nullable_to_non_nullable
              as List<Coordinate>?,
      weather: freezed == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather?,
    ));
  }
}

/// @nodoc

class _$_WeatherState implements _WeatherState {
  _$_WeatherState(
      {this.loadingStatus, final List<Coordinate>? coordinate, this.weather})
      : _coordinate = coordinate;

  @override
  final LoadingStatus? loadingStatus;
  final List<Coordinate>? _coordinate;
  @override
  List<Coordinate>? get coordinate {
    final value = _coordinate;
    if (value == null) return null;
    if (_coordinate is EqualUnmodifiableListView) return _coordinate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Weather? weather;

  @override
  String toString() {
    return 'WeatherState(loadingStatus: $loadingStatus, coordinate: $coordinate, weather: $weather)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherState &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            const DeepCollectionEquality()
                .equals(other._coordinate, _coordinate) &&
            (identical(other.weather, weather) || other.weather == weather));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadingStatus,
      const DeepCollectionEquality().hash(_coordinate), weather);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherStateCopyWith<_$_WeatherState> get copyWith =>
      __$$_WeatherStateCopyWithImpl<_$_WeatherState>(this, _$identity);
}

abstract class _WeatherState implements WeatherState {
  factory _WeatherState(
      {final LoadingStatus? loadingStatus,
      final List<Coordinate>? coordinate,
      final Weather? weather}) = _$_WeatherState;

  @override
  LoadingStatus? get loadingStatus;
  @override
  List<Coordinate>? get coordinate;
  @override
  Weather? get weather;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherStateCopyWith<_$_WeatherState> get copyWith =>
      throw _privateConstructorUsedError;
}
