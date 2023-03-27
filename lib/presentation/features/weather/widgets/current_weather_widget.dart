import 'package:flutter/material.dart';
import 'package:weather_app/common/resources/app_text_styles.dart';
import 'package:weather_app/domain/entities/coordinate/coordinate.dart';
import 'package:weather_app/domain/entities/weather/current_weather.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({
    Key? key,
    required this.coordinate,
    required this.currentWeather,
  }) : super(key: key);

  final Coordinate coordinate;
  final CurrentWeather currentWeather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          coordinate.cityName,
          style: AppTextStyles.whiteS30W400,
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Text(
              '${currentWeather.currentTemp}',
              style: AppTextStyles.whiteS60W400,
            ),
            Positioned(
              right: -35,
              child: Text(
                '\u00B0',
                style: AppTextStyles.whiteS60W400,
              ),
            )
          ],
        ),
        Text(
          currentWeather.description,
          style: AppTextStyles.whiteS30W400,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: 'L:${currentWeather.minTemp}\u00B0 ',
            style: AppTextStyles.blueS30W400,
          ),
          TextSpan(
            text: 'H:${currentWeather.maxTemp}\u00B0',
            style: AppTextStyles.redS30W400,
          ),
        ]))
      ],
    );
  }
}
