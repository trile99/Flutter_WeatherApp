import 'package:flutter/material.dart';
import 'package:weather_app/common/resources/app_text_styles.dart';
import 'package:weather_app/domain/entities/coordinate/coordinate.dart';
import 'package:weather_app/domain/entities/weather/weather.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({
    Key? key,
    required this.coordinate,
    required this.weather,
  }) : super(key: key);

  final Coordinate coordinate;
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final String cityName = coordinate.localName?.en ?? '';
    final String temp = '${weather.main?.temp?.round()}\u00B0';
    final String main = weather.forecast?.first.main ?? '';
    final int maxTemp = weather.main?.tempMax?.round() ?? 0;
    final int lowTemp = weather.main?.tempMin?.round() ?? 0;
    final String highAndLowTemp = 'H:$maxTemp\u00B0 L:$lowTemp\u00B0';
    final String icon = weather.forecast?.first.icon ?? '';

    return Column(
      children: [
        Text(
          cityName,
          style: AppTextStyles.whiteS18W400,
        ),
        Image.network(
          'http://openweathermap.org/img/wn/$icon@2x.png',
          errorBuilder: (context, error, stackTrace) =>
              const CircularProgressIndicator(),
        ),
        Text(temp),
        Text(main),
        Text(highAndLowTemp),
      ],
    );
  }
}
