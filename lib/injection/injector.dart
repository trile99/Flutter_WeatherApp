import 'package:get_it/get_it.dart';
import 'package:weather_app/injection/bloc_injection.dart';
import 'package:weather_app/injection/infra_injection.dart';
import 'package:weather_app/injection/repository_injetion.dart';
import 'package:weather_app/injection/use_case_injection.dart';

GetIt injector = GetIt.instance;

Future<void> initDependenciesInjection() async {
  // Infra
  await InfraInjection.inject();

  // Repositories
  RepositoryInjection.inject();

  // Use case
  UserCaseInjection.inject();

  // Cubit
  CubitInjection.inject();
}
