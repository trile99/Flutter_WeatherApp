import 'package:own_inbox_app/data/params/weather_param.dart';
import 'package:own_inbox_app/domain/entities/weather/weather.dart';
import 'package:own_inbox_app/domain/repositories/weather_repositories.dart';
import 'package:own_inbox_app/domain/use_cases/use_case_base.dart';

class GetWeatherUseCase extends FutureNormalUseCase<WeatherParam, Weather?> {
  GetWeatherUseCase(this._weatherRepository);

  final WeatherRepositories _weatherRepository;

  @override
  Future<Weather?> call(WeatherParam param) async {
    return await _weatherRepository.getWeather(param.lat, param.lon);
  }
}
