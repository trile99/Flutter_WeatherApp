import 'package:own_inbox_app/domain/entities/coordinate/coordinate.dart';
import 'package:own_inbox_app/domain/entities/weather/weather.dart';

abstract class WeatherRepositories {
  Future<List<Coordinate>?> getCoordinate(String cityName);
  Future<Weather?> getWeather(double lat, double lon);
}
