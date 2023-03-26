import 'package:weather_app/domain/entities/coordinate/coordinate.dart';
import 'package:weather_app/domain/entities/forecast/forecasts.dart';
import 'package:weather_app/domain/entities/weather/current_weather.dart';

abstract class WeatherRepositories {
  Future<List<Coordinate>?> getCoordinate(String cityName);
  Future<CurrentWeather?> getWeather(double lat, double lon);
  Future<Forecasts?> getForecast(double lat, double lon);
}
