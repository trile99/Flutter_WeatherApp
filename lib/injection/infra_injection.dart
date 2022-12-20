import 'package:dio/dio.dart';
import 'package:weather_app/data/data_sources/api/api_client.dart';
import 'package:weather_app/injection/injector.dart';

class InfraInjection {
  static void inject() {
    // API
    injector.registerLazySingleton<ApiClient>(
      () => ApiClient(Dio()),
    );
  }
}
