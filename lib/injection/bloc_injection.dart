import 'package:weather_app/domain/use_cases/get_coordinate_use_case.dart';
import 'package:weather_app/domain/use_cases/get_forecast_use_case.dart';
import 'package:weather_app/domain/use_cases/get_weather_use_case.dart';
import 'package:weather_app/global/services/local_storage_service.dart';
import 'package:weather_app/injection/injector.dart';
import 'package:weather_app/presentation/bloc/weather/weather_cubit.dart';

class CubitInjection {
  static void inject() {
    injector.registerLazySingleton<WeatherCubit>(
      () => WeatherCubit(
        injector.get<GetCoordinateUseCase>(),
        injector.get<GetWeatherUseCase>(),
        injector.get<GetForecastUseCase>(),
        injector.get<LocalStorageServices>(),
      ),
    );
  }
}
