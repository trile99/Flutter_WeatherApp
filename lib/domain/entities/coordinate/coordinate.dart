import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/common/resources/app_strings.dart';

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

  double get roundLat => double.parse(lat.toStringAsFixed(2));

  double get roundLon => double.parse(lon.toStringAsFixed(2));

  String get cityName {
    switch (AppStrings.appLocale) {
      case 'vi':
        return localName.vi;
      case 'ja':
        return localName.ja;
      default:
        return localName.en;
    }
  }
}

@Freezed(toJson: false)
class LocalName with _$LocalName {
  const factory LocalName({
    @Default('') String en,
    @Default('') String vi,
    @Default('') String ja,
  }) = _LocalName;

  factory LocalName.fromJson(Map<String, dynamic> json) =>
      _$LocalNameFromJson(json);
}
