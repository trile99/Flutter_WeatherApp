import 'package:flutter/material.dart';
import 'package:weather_app/common/resources/app_colors.dart';
import 'package:weather_app/common/resources/app_text_styles.dart';
import 'package:weather_app/domain/entities/coordinate/coordinate.dart';
import 'package:weather_app/domain/entities/weather/current_weather.dart';
import 'package:weather_app/router/navigator.dart';

class CurrentWeatherVerticalWidget extends StatelessWidget {
  const CurrentWeatherVerticalWidget({
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
              style: AppTextStyles.whiteS100W400,
            ),
            Positioned(
              right: -35,
              child: Text(
                '\u00B0',
                style: AppTextStyles.whiteS100W400,
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

class CurrentWeatherHorizontalWidget extends StatelessWidget {
  const CurrentWeatherHorizontalWidget({
    Key? key,
    required this.coordinate,
    required this.currentWeather,
  }) : super(key: key);

  final Coordinate coordinate;
  final CurrentWeather currentWeather;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // AppNavigator.pushNamed(RouterName.weather,
        //     arguments: WeatherScreen(cityName: coordinate.cityName));
        AppNavigator.pop();
      },
      child: Container(
        height: 120,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coordinate.cityName,
                    style: AppTextStyles.whiteS24W600,
                  ),
                  Text(
                    currentWeather.description,
                    style: AppTextStyles.whiteS20W400,
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${currentWeather.currentTemp}\u00B0',
                  style: AppTextStyles.whiteS50W400,
                ),
                Text(
                  'H:${currentWeather.maxTemp}\u00B0 L:${currentWeather.minTemp}\u00B0',
                  style: AppTextStyles.whiteS20W400,
                )
              ],
            ),
          ],
        ),
        // child: Text('as', style: AppTextStyles.whiteS20W400,),
      ),
    );
  }
}
