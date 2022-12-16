import 'package:own_inbox_app/config/evn_config.dart';
import 'package:own_inbox_app/injection/injector.dart';

class EnvInjection {
  static void inject(EnvConfig env) {
    injector.registerLazySingleton<EnvConfig>(() => env);
  }
}
