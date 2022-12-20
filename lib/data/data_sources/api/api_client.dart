import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_app/data/data_sources/api/api_resources.dart';
import 'package:weather_app/domain/entities/coordinate/coordinate.dart';
import 'package:weather_app/domain/entities/weather/weather.dart';
import 'package:weather_app/global/app_constants.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: ApiResources.devBaseURL)
abstract class ApiClient {
  factory ApiClient(
    Dio dio, {
    String baseUrl,
  }) = _ApiClient;

  static const Type client = _ApiClient;

  @GET('/geo/1.0/direct')
  Future<List<Coordinate>?> getCoordinate(
    @Query('q') String cityName, {
    @Query('appid') String appId = AppConstants.appId,
  });

  @GET('/data/2.5/weather')
  Future<Weather> getWeather(
    @Query('lat') double lat,
    @Query('lon') double lon, {
    @Query('units') String units = AppConstants.unit,
    @Query('appid') String appId = AppConstants.appId,
  });
}
