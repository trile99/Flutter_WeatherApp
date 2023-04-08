part of 'weather_cubit.dart';

@freezed
class WeatherState with _$WeatherState {
  factory WeatherState({
    LoadingStatus? loadingStatus,
    Coordinate? coordinate,
    List<Coordinate>? coordinateList,
    CurrentWeather? weather,
    List<CurrentWeather>? weatherList,
    Forecasts? forecasts,
    List<Forecasts>? forecastList,
  }) = _WeatherState;

  factory WeatherState.initial() =>
      WeatherState(loadingStatus: LoadingStatus.loading);
}
