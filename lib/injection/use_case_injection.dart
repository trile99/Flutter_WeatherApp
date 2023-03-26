import 'package:weather_app/domain/repositories/weather_repositories.dart';
import 'package:weather_app/domain/use_cases/get_coordinate_use_case.dart';
import 'package:weather_app/domain/use_cases/get_forecast_use_case.dart';
import 'package:weather_app/domain/use_cases/get_weather_use_case.dart';
import 'package:weather_app/injection/injector.dart';

class UserCaseInjection {
  static void inject() {
    injector.registerLazySingleton<GetCoordinateUseCase>(
      () => GetCoordinateUseCase(
        injector.get<WeatherRepositories>(),
      ),
    );
    injector.registerLazySingleton<GetWeatherUseCase>(
      () => GetWeatherUseCase(
        injector.get<WeatherRepositories>(),
      ),
    );
    injector.registerLazySingleton<GetForecastUseCase>(
      () => GetForecastUseCase(
        injector.get<WeatherRepositories>(),
      ),
    );
  }
}
