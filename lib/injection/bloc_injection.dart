import 'package:own_inbox_app/domain/use_cases/get_coordinate_use_case.dart';
import 'package:own_inbox_app/domain/use_cases/get_weather_use_case.dart';
import 'package:own_inbox_app/injection/injector.dart';
import 'package:own_inbox_app/presentation/bloc/weather/weather_cubit.dart';

class BlocInjection {
  static void inject() {
    injector.registerLazySingleton<WeatherCubit>(
      () => WeatherCubit(
        injector.get<GetCoordinateUseCase>(),
        injector.get<GetWeatherUseCase>(),
      ),
    );
  }
}
