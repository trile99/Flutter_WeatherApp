import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    @JsonKey(name: 'weather') List<Forecast>? forecast,
    Main? main,
    Wind? wind,
    @JsonKey(name: 'clouds') Cloud? cloud,
    Sys? sys,
    String? name,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@freezed
class Forecast with _$Forecast {
  const factory Forecast({
    String? main,
    String? description,
    String? icon,
  }) = _Forecast;

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
}

@freezed
class Main with _$Main {
  const factory Main({
    double? temp,
    @JsonKey(name: 'feels_like') double? feelsLike,
    @JsonKey(name: 'temp_min') double? tempMin,
    @JsonKey(name: 'temp_max') double? tempMax,
    double? pressure,
    double? humidity,
  }) = _Main;

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@freezed
class Wind with _$Wind {
  const factory Wind({
    double? speed,
    int? deg,
  }) = _Wind;

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}

@freezed
class Cloud with _$Cloud {
  const factory Cloud({
    int? all,
  }) = _Cloud;

  factory Cloud.fromJson(Map<String, dynamic> json) => _$CloudFromJson(json);
}

@freezed
class Sys with _$Sys {
  const factory Sys({
    String? country,
    int? sunrise,
    int? sunset,
  }) = _Sys;

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}
