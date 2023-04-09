import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/data/params/weather_param.dart';
import 'package:weather_app/domain/entities/coordinate/coordinate.dart';
import 'package:weather_app/domain/entities/forecast/forecasts.dart';
import 'package:weather_app/domain/entities/weather/current_weather.dart';
import 'package:weather_app/domain/use_cases/get_coordinate_use_case.dart';
import 'package:weather_app/domain/use_cases/get_forecast_use_case.dart';
import 'package:weather_app/domain/use_cases/get_weather_use_case.dart';
import 'package:weather_app/global/services/local_storage_service.dart';
import 'package:weather_app/presentation/enums/loading_status.dart';

part 'weather_cubit.freezed.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(
    this._getCoordinateUseCase,
    this._getWeatherUseCase,
    this._getForecastUseCase,
    this._localStorageServices, {
    WeatherState? initial,
  }) : super(initial ?? WeatherState(loadingStatus: LoadingStatus.initial));

  final GetCoordinateUseCase _getCoordinateUseCase;
  final GetWeatherUseCase _getWeatherUseCase;
  final GetForecastUseCase _getForecastUseCase;
  final LocalStorageServices _localStorageServices;

  Future<void> initialWeather() async {
    final list = _localStorageServices.cityNameList;

    for (String e in list) {
      await searchWeatherByCityName(e);
    }
  }

  Future<Coordinate?> getCoordinateByCityName(String cityName) async {
    emit(state.copyWith(
      loadingStatus: LoadingStatus.initial,
    ));

    try {
      emit(state.copyWith(
        loadingStatus: LoadingStatus.loading,
      ));
      final response = await _getCoordinateUseCase(cityName) ?? [];
      emit(state.copyWith(
        coordinate: response.first,
        loadingStatus: LoadingStatus.success,
      ));

      return response.first;
    } catch (e) {
      emit(state.copyWith(
        loadingStatus: LoadingStatus.failed,
      ));

      return null;
    }
  }

  Future<CurrentWeather?> getWeatherByCoord(Coordinate coordinate) async {
    final LatLonParam latlonParam = LatLonParam(
      lat: coordinate.lat,
      lon: coordinate.lon,
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

  Future<Forecasts?> getForecastByCoord(Coordinate coordinate) async {
    final LatLonParam latLonParam = LatLonParam(
      lat: coordinate.lat,
      lon: coordinate.lon,
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

  Future<void> addCoordinateList(Coordinate coordinate) async {
    final List<Coordinate> coordinateList =
        List<Coordinate>.from(state.coordinateList ?? []);

    if (coordinateList.isEmpty) {
      coordinateList.add(coordinate);
    } else {
      final isEmpty = coordinateList
          .where((Coordinate element) => element.lat == coordinate.lat)
          .toList()
          .isEmpty;
      if (isEmpty) {
        coordinateList.add(coordinate);
      }
    }

    await _localStorageServices
        .setCityNameList(coordinateList.map((e) => e.name).toList());

    emit(state.copyWith(
      coordinateList: coordinateList,
    ));
  }

  void addCurrentWeatherList(CurrentWeather currentWeather) {
    final List<CurrentWeather> currentWeatherList =
        List<CurrentWeather>.from(state.weatherList ?? []);

    if (currentWeatherList.isEmpty) {
      currentWeatherList.add(currentWeather);
    } else {
      final isEmpty = currentWeatherList
          .where((CurrentWeather element) =>
              element.coord?.lat == currentWeather.coord?.lat)
          .toList()
          .isEmpty;
      if (isEmpty) {
        currentWeatherList.add(currentWeather);
      }
    }

    emit(state.copyWith(
      weatherList: currentWeatherList,
    ));
  }

  void addForecastList(Forecasts forecasts) {
    final List<Forecasts> forecastList =
        List<Forecasts>.from(state.forecastList ?? []);

    if (forecastList.isEmpty) {
      forecastList.add(forecasts);
    } else {
      final isEmpty = forecastList
          .where((Forecasts element) =>
              element.city?.coord?.lat == forecasts.city?.coord?.lat)
          .toList()
          .isEmpty;
      if (isEmpty) {
        forecastList.add(forecasts);
      }
    }

    emit(state.copyWith(
      forecastList: forecastList,
    ));
  }

  Future<void> searchWeatherByCityName(String cityName) async {
    final Coordinate coordinate =
        await getCoordinateByCityName(cityName) ?? Coordinate();
    await addCoordinateList(coordinate);

    final CurrentWeather currentWeather =
        await getWeatherByCoord(coordinate) ?? CurrentWeather();
    addCurrentWeatherList(currentWeather);

    final Forecasts forecasts =
        await getForecastByCoord(coordinate) ?? Forecasts();
    addForecastList(forecasts);
  }

  void updateDisplayWeatherByCoordinate(Coordinate coordinate) {
    Coordinate coord = List<Coordinate>.from(state.coordinateList!)
        .firstWhere((element) => element.roundLat == coordinate.roundLat);
    CurrentWeather curr = List<CurrentWeather>.from(state.weatherList!)
        .firstWhere(
            (element) => element.coord?.roundLat == coordinate.roundLat);
    Forecasts forecasts = List<Forecasts>.from(state.forecastList!).firstWhere(
        (element) => element.city?.coord?.roundLat == coordinate.roundLat);

    emit(state.copyWith(
      coordinate: coord,
      weather: curr,
      forecasts: forecasts,
    ));
  }
}
