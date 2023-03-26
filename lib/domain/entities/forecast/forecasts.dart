import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/common/extensions/datetime_extension.dart';
import 'package:weather_app/common/extensions/int_extension.dart';
import 'package:weather_app/domain/entities/weather/current_weather.dart';

part 'forecasts.freezed.dart';

part 'forecasts.g.dart';

@Freezed(toJson: false)
class Forecasts with _$Forecasts {
  factory Forecasts({
    @Default(<Forecast>[]) @JsonKey(name: 'list') List<Forecast> forecastList,
  }) = _Forecasts;

  Forecasts._();

  factory Forecasts.fromJson(Map<String, dynamic> json) =>
      _$ForecastsFromJson(json);

  List<Forecast> get todayForecastList => forecastList
      .where((element) => element.weekday == DateTime.now().weekday)
      .toList();

  List<Forecast> get comingForecastList => forecastList
      .where((element) => element.weekday != DateTime.now().weekday)
      .toList();

  Forecast minTempByWeekday(int weekday, List<Forecast> listForecast) {
    final list =
        listForecast.where((element) => element.weekday == weekday).toList();
    list.sort((a, b) => a.main.tempMin.compareTo(b.main.tempMin));
    return list.first;
  }

  Forecast maxTempByWeekday(int weekday, List<Forecast> listForecast) {
    final list =
        listForecast.where((element) => element.weekday == weekday).toList();
    list.sort((a, b) => a.main.tempMax.compareTo(b.main.tempMax));
    return list.last;
  }

  List<Forecast> get minTempForecastList {
    final comingWeekDayList =
        comingForecastList.map((e) => e.weekday).toSet().toList();
    final List<Forecast> list = [];
    for (var e in comingWeekDayList) {
      list.add(minTempByWeekday(e, comingForecastList));
    }
    return list;
  }

  List<Forecast> get maxTempForecastList {
    final comingWeekDayList =
        comingForecastList.map((e) => e.weekday).toSet().toList();
    final List<Forecast> list = [];
    for (var e in comingWeekDayList) {
      list.add(maxTempByWeekday(e, comingForecastList));
    }
    return list;
  }
}

@Freezed(toJson: false)
class Forecast with _$Forecast {
  factory Forecast({
    @Default(0) int dt,
    @Default(Main()) Main main,
    @Default(<Weather>[]) List<Weather> weather,
    @Default(Wind()) Wind wind,
    @Default(Cloud()) @JsonKey(name: 'clouds') Cloud cloud,
  }) = _Forecast;

  Forecast._();

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  String get iconString => weather.first.icon;

  int get maxTemp => main.tempMax.round();

  int get minTemp => main.tempMin.round();

  int get weekday {
    return dt.fromEpochToDateTime.weekday;
  }

  String get weekdayName {
    return dt.fromEpochToDateTime.weekDayName;
  }
}
