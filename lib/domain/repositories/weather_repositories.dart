import 'package:weather_app/domain/entities/coordinate/coordinate.dart';
import 'package:weather_app/domain/entities/weather/weather.dart';

abstract class WeatherRepositories {
  Future<List<Coordinate>?> getCoordinate(String cityName);
  Future<Weather?> getWeather(double lat, double lon);
}
