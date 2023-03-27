import 'package:weather_app/data/data_sources/api/api_resources.dart';

enum Environment { dev, stg, qa, prod, mock }

class EnvConfig {
  EnvConfig.development()
      : environment = Environment.dev,
        baseURL = ApiResources.devBaseURL;

  EnvConfig.staging()
      : environment = Environment.stg,
        baseURL = ApiResources.stgBaseURL;

  EnvConfig.qa()
      : environment = Environment.qa,
        baseURL = ApiResources.qaBaseURL;

  EnvConfig.production()
      : environment = Environment.prod,
        baseURL = ApiResources.prodBaseURL;

  late Environment environment;
  late String baseURL;

  bool get isDevelopment => environment == Environment.dev;

  bool get isStaging => environment == Environment.stg;

  bool get isQA => environment == Environment.qa;

  bool get isMock => environment == Environment.mock;

  bool get isProduction => environment == Environment.prod;
}
