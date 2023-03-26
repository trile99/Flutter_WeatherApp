import 'package:freezed_annotation/freezed_annotation.dart';

part 'coordinate.freezed.dart';

part 'coordinate.g.dart';

@Freezed(toJson: false)
class Coordinate with _$Coordinate {
  factory Coordinate({
    @Default('') String name,
    @Default(LocalName()) @JsonKey(name: 'local_names') LocalName localName,
    @Default(0.0) double lat,
    @Default(0.0) double lon,
    @Default('') String country,
  }) = _Coordinate;

  Coordinate._();

  factory Coordinate.fromJson(Map<String, dynamic> json) =>
      _$CoordinateFromJson(json);

  String get cityName => localName.en;
}

@Freezed(toJson: false)
class LocalName with _$LocalName {
  const factory LocalName({
    @Default('') String en,
    @Default('') String vi,
    @Default('') String ko,
  }) = _LocalName;

  factory LocalName.fromJson(Map<String, dynamic> json) =>
      _$LocalNameFromJson(json);
}
