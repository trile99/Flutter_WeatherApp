import 'package:weather_app/data/data_sources/api/api_resources.dart';

enum Environment { dev, stg, qa, prod, mock }

class EnvConfig {
  EnvConfig.production()
      : environment = Environment.prod,
        getGeoApi = ApiResources.prodBaseUrl;

  EnvConfig.mock()
      : environment = Environment.mock,
        getGeoApi = ApiResources.getIconApi;

  EnvConfig.qa()
      : environment = Environment.qa,
        getGeoApi = ApiResources.qaBaseUrl;

  EnvConfig.staging()
      : environment = Environment.stg,
        getGeoApi = ApiResources.baseURL,
        getWeatherApi = ApiResources.getIconApi;

  EnvConfig.development()
      : environment = Environment.dev,
        getGeoApi = ApiResources.baseURL,
        getWeatherApi = ApiResources.getIconApi;

  late Environment environment;
  late String getGeoApi;
  late String getWeatherApi;

  bool get isDevelopment => environment == Environment.dev;

  bool get isStaging => environment == Environment.stg;

  bool get isQA => environment == Environment.qa;

  bool get isMock => environment == Environment.mock;

  bool get isProduction => environment == Environment.prod;
}
