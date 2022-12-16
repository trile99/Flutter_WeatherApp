import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/data/params/weather_param.dart';
import 'package:weather_app/domain/entities/coordinate/coordinate.dart';
import 'package:weather_app/domain/entities/weather/weather.dart';
import 'package:weather_app/domain/use_cases/get_coordinate_use_case.dart';
import 'package:weather_app/domain/use_cases/get_weather_use_case.dart';
import 'package:weather_app/presentation/enums/loading_status.dart';

part 'weather_cubit.freezed.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._getCoordinateUseCase, this._getWeatherUseCase,
      {WeatherState? initial})
      : super(initial ?? WeatherState(loadingStatus: LoadingStatus.initial));

  final GetCoordinateUseCase _getCoordinateUseCase;
  final GetWeatherUseCase _getWeatherUseCase;

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

  Future<Weather?> getWeather() async {
    final List<Coordinate>? response = await getCoordinate('danang');
    final WeatherParam weatherParam = WeatherParam(
      lat: response?.first.lat ?? 0,
      lon: response?.first.lon ?? 0,
    );
    emit(state.copyWith(loadingStatus: LoadingStatus.initial));

    try {
      emit(state.copyWith(loadingStatus: LoadingStatus.loading));
      final response = await _getWeatherUseCase(weatherParam);
      emit(state.copyWith(
        weather: response,
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
}
