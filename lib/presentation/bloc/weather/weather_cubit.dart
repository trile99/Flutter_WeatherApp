import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/data/params/weather_param.dart';
import 'package:weather_app/domain/entities/coordinate/coordinate.dart';
import 'package:weather_app/domain/entities/forecast/forecasts.dart';
import 'package:weather_app/domain/entities/weather/current_weather.dart';
import 'package:weather_app/domain/use_cases/get_coordinate_use_case.dart';
import 'package:weather_app/domain/use_cases/get_forecast_use_case.dart';
import 'package:weather_app/domain/use_cases/get_weather_use_case.dart';
import 'package:weather_app/presentation/enums/loading_status.dart';

part 'weather_cubit.freezed.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(
    this._getCoordinateUseCase,
    this._getWeatherUseCase,
    this._getForecastUseCase, {
    WeatherState? initial,
  }) : super(initial ?? WeatherState(loadingStatus: LoadingStatus.initial));

  final GetCoordinateUseCase _getCoordinateUseCase;
  final GetWeatherUseCase _getWeatherUseCase;
  final GetForecastUseCase _getForecastUseCase;

  Future<List<Coordinate>?> getCoordinate(String cityName) async {
    emit(state.copyWith(
      loadingStatus: LoadingStatus.initial,
    ));

    try {
      emit(state.copyWith(
        loadingStatus: LoadingStatus.loading,
      ));
      final response = await _getCoordinateUseCase(cityName);
      emit(state.copyWith(
        coordinate: response,
        loadingStatus: LoadingStatus.success,
      ));

      return response;
    } catch (e) {
      emit(state.copyWith(
        loadingStatus: LoadingStatus.failed,
      ));

      return null;
    }
  }

  Future<CurrentWeather?> getWeather() async {
    final List<Coordinate>? response = await getCoordinate('danang');
    final LatLonParam latlonParam = LatLonParam(
      lat: response?.first.lat ?? 0,
      lon: response?.first.lon ?? 0,
    );
    emit(state.copyWith(loadingStatus: LoadingStatus.initial));

    try {
      emit(state.copyWith(loadingStatus: LoadingStatus.loading));
      final response = await _getWeatherUseCase(latlonParam);
      emit(state.copyWith(
        weather: response,
        loadingStatus: LoadingStatus.success,
      ));

      return response;
    } catch (e) {
      emit(state.copyWith(loadingStatus: LoadingStatus.failed));

      return null;
    }
  }

  Future<Forecasts?> getForecast() async {
    final List<Coordinate>? coordinates = await getCoordinate('danang');
    final LatLonParam latLonParam = LatLonParam(
      lat: coordinates?.first.lat ?? 0,
      lon: coordinates?.first.lon ?? 0,
    );

    emit(state.copyWith(loadingStatus: LoadingStatus.initial));

    try {
      emit(state.copyWith(loadingStatus: LoadingStatus.loading));
      final forecasts = await _getForecastUseCase(latLonParam);
      emit(state.copyWith(
        forecasts: forecasts,
        loadingStatus: LoadingStatus.success,
      ));

      return forecasts;
    } catch (e) {
      emit(state.copyWith(loadingStatus: LoadingStatus.failed));

      return null;
    }
  }
}
