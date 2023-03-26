import 'package:weather_app/data/params/weather_param.dart';
import 'package:weather_app/domain/entities/forecast/forecasts.dart';
import 'package:weather_app/domain/repositories/weather_repositories.dart';
import 'package:weather_app/domain/use_cases/use_case_base.dart';

class GetForecastUseCase extends FutureNormalUseCase<LatLonParam, Forecasts?> {
  final WeatherRepositories _weatherRepositories;

  GetForecastUseCase(this._weatherRepositories);

  @override
  Future<Forecasts?> call(LatLonParam param) async {
    return await _weatherRepositories.getForecast(param.lat, param.lon);
  }
}
