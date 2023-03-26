part of 'weather_cubit.dart';

@freezed
class WeatherState with _$WeatherState {
  factory WeatherState({
    LoadingStatus? loadingStatus,
    @Default('danang') String cityName,
    List<Coordinate>? coordinate,
    CurrentWeather? weather,
    Forecasts? forecasts,
  }) = _WeatherState;

  factory WeatherState.initial() =>
      WeatherState(loadingStatus: LoadingStatus.loading);
}
