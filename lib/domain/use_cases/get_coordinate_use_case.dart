import 'package:weather_app/domain/entities/coordinate/coordinate.dart';
import 'package:weather_app/domain/repositories/weather_repositories.dart';
import 'package:weather_app/domain/use_cases/use_case_base.dart';

class GetCoordinateUseCase
    extends FutureNormalUseCase<String, List<Coordinate>?> {
  GetCoordinateUseCase(this._weatherRepositories);

  final WeatherRepositories _weatherRepositories;

  @override
  Future<List<Coordinate>?> call(String param) async {
    return await _weatherRepositories.getCoordinate(param);
  }
}
