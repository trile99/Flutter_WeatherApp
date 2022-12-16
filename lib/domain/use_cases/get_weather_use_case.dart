import 'package:weather_app/data/params/weather_param.dart';
import 'package:weather_app/domain/entities/weather/weather.dart';
import 'package:weather_app/domain/repositories/weather_repositories.dart';
import 'package:weather_app/domain/use_cases/use_case_base.dart';

class GetWeatherUseCase extends FutureNormalUseCase<WeatherParam, Weather?> {
  GetWeatherUseCase(this._weatherRepository);

  final WeatherRepositories _weatherRepository;

  @override
  Future<Weather?> call(WeatherParam param) async {
    return await _weatherRepository.getWeather(param.lat, param.lon);
  }
}
