import 'package:weather_app/data/data_sources/api/api_client.dart';
import 'package:weather_app/data/repositories/weather_repositoried_imp.dart';
import 'package:weather_app/domain/repositories/weather_repositories.dart';
import 'package:weather_app/injection/injector.dart';

class RepositoryInjection {
  static void inject() {
    injector.registerLazySingleton<WeatherRepositories>(
      () => WeatherRepositoryImp(
        injector.get<WeatherApi>(),
        injector.get<WeatherApi>(),
      ),
    );
  }
}
