import 'package:weather_app/data/data_sources/api/api_client.dart';
import 'package:weather_app/domain/entities/coordinate/coordinate.dart';
import 'package:weather_app/domain/entities/weather/weather.dart';
import 'package:weather_app/domain/repositories/weather_repositories.dart';

class WeatherRepositoryImp extends WeatherRepositories {
  WeatherRepositoryImp(this._apiClient);
  final ApiClient _apiClient;

  @override
  Future<List<Coordinate>?> getCoordinate(String cityName) async {
    return await _apiClient.getCoordinate(cityName);
  }

  @override
  Future<Weather?> getWeather(double lat, double lon) async {
    return await _apiClient.getWeather(lat, lon);
  }
}
