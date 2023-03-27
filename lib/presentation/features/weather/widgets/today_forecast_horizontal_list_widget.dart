import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/common/extensions/int_extension.dart';
import 'package:weather_app/common/helpers/function_helper.dart';
import 'package:weather_app/common/resources/app_text_styles.dart';
import 'package:weather_app/domain/entities/forecast/forecasts.dart';

class TodayForecastHorizontalListWidget extends StatelessWidget {
  const TodayForecastHorizontalListWidget({
    Key? key,
    required this.forecastList,
  }) : super(key: key);

  final List<Forecast> forecastList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(minWidth: MediaQuery.of(context).size.width),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < forecastList.length; i++)
              Column(
                children: [
                  Text(
                    forecastList[i].dt.fromEpochToDateTime.hour.toString(),
                    style: AppTextStyles.whiteS20W400,
                  ),
                  SizedBox(
                    width: 70.w,
                    height: 70.w,
                    child: Image.network(
                      FunctionHelper.iconURL(forecastList[i].iconString),
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) =>
                          const CircularProgressIndicator(),
                    ),
                  ),
                  Text(
                    '${forecastList[i].main.temp.round()}\u00B0',
                    style: AppTextStyles.whiteS20W400,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
