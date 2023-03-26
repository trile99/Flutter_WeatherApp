import 'package:weather_app/data/data_sources/api/api_client.dart';
import 'package:weather_app/domain/entities/coordinate/coordinate.dart';
import 'package:weather_app/domain/entities/forecast/forecasts.dart';
import 'package:weather_app/domain/entities/weather/current_weather.dart';
import 'package:weather_app/domain/repositories/weather_repositories.dart';

class WeatherRepositoryImp extends WeatherRepositories {
  WeatherRepositoryImp(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<List<Coordinate>?> getCoordinate(String cityName) async {
    return await _apiClient.getCoordinate(cityName);
  }

  @override
  Future<CurrentWeather?> getWeather(double lat, double lon) async {
    return await _apiClient.getWeather(lat, lon);
  }

  @override
  Future<Forecasts?> getForecast(double lat, double lon) async {
    return await _apiClient.getForecast(lat, lon);
  }
}
