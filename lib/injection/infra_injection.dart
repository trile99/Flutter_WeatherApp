import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/data/data_sources/api/api_client.dart';
import 'package:weather_app/global/services/local_storage_service.dart';
import 'package:weather_app/injection/injector.dart';

class InfraInjection {
  static Future<void> inject() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    // API
    injector.registerLazySingleton<ApiClient>(
      () => ApiClient(Dio()),
    );

    // SharedPreferences
    injector.registerLazySingleton<LocalStorageServices>(
      () => LocalStorageServices(sharedPreferences),
    );
  }
}
