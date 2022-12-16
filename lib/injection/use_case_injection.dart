import 'package:own_inbox_app/domain/repositories/weather_repositories.dart';
import 'package:own_inbox_app/domain/use_cases/get_coordinate_use_case.dart';
import 'package:own_inbox_app/domain/use_cases/get_weather_use_case.dart';
import 'package:own_inbox_app/injection/injector.dart';

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
  }
}