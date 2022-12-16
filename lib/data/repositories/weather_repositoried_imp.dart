import 'package:own_inbox_app/data/data_sources/api/api_client.dart';
import 'package:own_inbox_app/domain/entities/coordinate/coordinate.dart';
import 'package:own_inbox_app/domain/entities/weather/weather.dart';
import 'package:own_inbox_app/domain/repositories/weather_repositories.dart';

class WeatherRepositoryImp extends WeatherRepositories {
  WeatherRepositoryImp(this._geoAPI, this._weatherAPI);
  final WeatherApi _geoAPI;
  final WeatherApi _weatherAPI;

  @override
  Future<List<Coordinate>?> getCoordinate(String cityName) async {
    return await _geoAPI.getCoordinate(cityName);
  }

  @override
  Future<Weather?> getWeather(double lat, double lon) async {
    return await _weatherAPI.getWeather(lat, lon);
  }
}
