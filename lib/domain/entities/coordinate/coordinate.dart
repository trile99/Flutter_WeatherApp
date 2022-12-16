import 'package:freezed_annotation/freezed_annotation.dart';

part 'coordinate.freezed.dart';
part 'coordinate.g.dart';

@freezed
class Coordinate with _$Coordinate {
  const factory Coordinate({
    String? name,
    @JsonKey(name: 'local_names') LocalName? localName,
    double? lat,
    double? lon,
    String? country,
  }) = _Coordinate;

  factory Coordinate.fromJson(Map<String, dynamic> json) =>
      _$CoordinateFromJson(json);
}

@freezed
class LocalName with _$LocalName {
  const factory LocalName({
    String? en,
    String? vi,
    String? ko,
  }) = _LocalName;

  factory LocalName.fromJson(Map<String, dynamic> json) =>
      _$LocalNameFromJson(json);
}
