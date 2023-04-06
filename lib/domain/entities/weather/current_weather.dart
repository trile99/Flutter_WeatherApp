import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_weather.freezed.dart';

part 'current_weather.g.dart';

@Freezed(toJson: false)
class CurrentWeather with _$CurrentWeather {
  factory CurrentWeather({
    @Default(Coord()) Coord coord,
    @Default(<Weather>[]) @JsonKey(name: 'weather') List<Weather> weathers,
    @Default(Main()) Main main,
    @Default(Wind()) Wind wind,
    @Default(Cloud()) @JsonKey(name: 'clouds') Cloud cloud,
    @Default(Sys()) Sys sys,
    @Default('') String name,
  }) = _CurrentWeather;

  CurrentWeather._();

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

  int get currentTemp => main.temp.round();

  int get maxTemp => main.tempMax.round();

  int get minTemp => main.tempMin.round();

  String get description => weathers.first.main;

  String get icon => weathers.first.icon;
}

@Freezed(toJson: false)
class Coord with _$Coord {
  const factory Coord({
    @Default(0.0) double lon,
    @Default(0.0) double lat,
  }) = _Coord;

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
}

@Freezed(toJson: false)
class Weather with _$Weather {
  const factory Weather({
    @Default('') String main,
    @Default('') String description,
    @Default('') String icon,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@Freezed(toJson: false)
class Main with _$Main {
  const factory Main({
    @Default(0.0) double temp,
    @Default(0.0) @JsonKey(name: 'feels_like') double feelsLike,
    @Default(0.0) @JsonKey(name: 'temp_min') double tempMin,
    @Default(0.0) @JsonKey(name: 'temp_max') double tempMax,
    @Default(0.0) double pressure,
    @Default(0.0) double humidity,
  }) = _Main;

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@Freezed(toJson: false)
class Wind with _$Wind {
  const factory Wind({
    @Default(0.0) double speed,
    @Default(0) int deg,
  }) = _Wind;

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}

@Freezed(toJson: false)
class Cloud with _$Cloud {
  const factory Cloud({
    @Default(0) int all,
  }) = _Cloud;

  factory Cloud.fromJson(Map<String, dynamic> json) => _$CloudFromJson(json);
}

@Freezed(toJson: false)
class Sys with _$Sys {
  const factory Sys({
    @Default('') String country,
    @Default(0) int sunrise,
    @Default(0) int sunset,
  }) = _Sys;

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}
