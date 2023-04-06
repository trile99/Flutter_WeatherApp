part of 'weather_cubit.dart';

@freezed
class WeatherState with _$WeatherState {
  factory WeatherState({
    LoadingStatus? loadingStatus,
    @Default('danang') String cityName,
    List<Coordinate>? coordinate,
    List<List<Coordinate>>? coordinateList,
    CurrentWeather? weather,
    List<CurrentWeather>? weatherList,
    Forecasts? forecasts,
    @Default(['danang']) List<String> cityNameList,
    @Default(false) bool isFocus,
  }) = _WeatherState;

  factory WeatherState.initial() =>
      WeatherState(loadingStatus: LoadingStatus.loading);
}
