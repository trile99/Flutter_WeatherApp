// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Weather _$$_WeatherFromJson(Map<String, dynamic> json) => _$_Weather(
      forecast: (json['weather'] as List<dynamic>?)
          ?.map((e) => Forecast.fromJson(e as Map<String, dynamic>))
          .toList(),
      main: json['main'] == null
          ? null
          : Main.fromJson(json['main'] as Map<String, dynamic>),
      wind: json['wind'] == null
          ? null
          : Wind.fromJson(json['wind'] as Map<String, dynamic>),
      cloud: json['clouds'] == null
          ? null
          : Cloud.fromJson(json['clouds'] as Map<String, dynamic>),
      sys: json['sys'] == null
          ? null
          : Sys.fromJson(json['sys'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_WeatherToJson(_$_Weather instance) =>
    <String, dynamic>{
      'weather': instance.forecast,
      'main': instance.main,
      'wind': instance.wind,
      'clouds': instance.cloud,
      'sys': instance.sys,
      'name': instance.name,
    };

_$_Forecast _$$_ForecastFromJson(Map<String, dynamic> json) => _$_Forecast(
      main: json['main'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$_ForecastToJson(_$_Forecast instance) =>
    <String, dynamic>{
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

_$_Main _$$_MainFromJson(Map<String, dynamic> json) => _$_Main(
      temp: (json['temp'] as num?)?.toDouble(),
      feelsLike: (json['feels_like'] as num?)?.toDouble(),
      tempMin: (json['temp_min'] as num?)?.toDouble(),
      tempMax: (json['temp_max'] as num?)?.toDouble(),
      pressure: (json['pressure'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_MainToJson(_$_Main instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };

_$_Wind _$$_WindFromJson(Map<String, dynamic> json) => _$_Wind(
      speed: (json['speed'] as num?)?.toDouble(),
      deg: json['deg'] as int?,
    );

Map<String, dynamic> _$$_WindToJson(_$_Wind instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
    };

_$_Cloud _$$_CloudFromJson(Map<String, dynamic> json) => _$_Cloud(
      all: json['all'] as int?,
    );

Map<String, dynamic> _$$_CloudToJson(_$_Cloud instance) => <String, dynamic>{
      'all': instance.all,
    };

_$_Sys _$$_SysFromJson(Map<String, dynamic> json) => _$_Sys(
      country: json['country'] as String?,
      sunrise: json['sunrise'] as int?,
      sunset: json['sunset'] as int?,
    );

Map<String, dynamic> _$$_SysToJson(_$_Sys instance) => <String, dynamic>{
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
