import 'package:dio/dio.dart';
import 'package:own_inbox_app/data/data_sources/api/api_client.dart';
import 'package:own_inbox_app/injection/injector.dart';

class InfraInjection {
  static void inject() {
    // API
    injector.registerLazySingleton<WeatherApi>(
      () => WeatherApi(Dio()),
    );
  }
}
