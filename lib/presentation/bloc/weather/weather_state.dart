part of 'weather_cubit.dart';

@freezed
class WeatherState with _$WeatherState {
  factory WeatherState({
    LoadingStatus? loadingStatus,
    List<Coordinate>? coordinate,
    Weather? weather,
  }) = _WeatherState;

  factory WeatherState.initial() =>
      WeatherState(loadingStatus: LoadingStatus.loading);
}
