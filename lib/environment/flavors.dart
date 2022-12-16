import 'environment_attribute.dart';

enum AppFlavor {
  development,
  staging,
  production,
}

class Flavor {
  static AppFlavor? appFlavor;

  static EnvironmentalAttribute get environment {
    switch (appFlavor) {
      case AppFlavor.development:
        return EnvironmentalAttribute.development();
      case AppFlavor.staging:
        return EnvironmentalAttribute.staging();
      case AppFlavor.production:
        return EnvironmentalAttribute.production();
      default:
        return EnvironmentalAttribute.development();
    }
  }
}
