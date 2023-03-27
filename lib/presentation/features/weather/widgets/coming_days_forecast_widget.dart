import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/common/helpers/function_helper.dart';
import 'package:weather_app/common/resources/app_colors.dart';
import 'package:weather_app/common/resources/app_strings.dart';
import 'package:weather_app/common/resources/app_text_styles.dart';
import 'package:weather_app/domain/entities/forecast/forecasts.dart';

class ComingDaysForecastWidget extends StatelessWidget {
  const ComingDaysForecastWidget({
    Key? key,
    required this.forecasts,
  }) : super(key: key);

  final Forecasts forecasts;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          color: AppColors.lightBlack),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.w),
              child: Text(
                AppStrings.localized.next5DayForecast,
                style: AppTextStyles.whiteS20W600,
              ),
            ),
            Divider(color: AppColors.white.withOpacity(0.5)),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: forecasts.minTempForecastList.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.w, top: 20.w),
                      child: Text(
                        forecasts.minTempForecastList[index].weekdayName,
                        style: AppTextStyles.whiteS20W400,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 125.w),
                      child: SizedBox(
                        width: 70.w,
                        height: 70.w,
                        child: Image.network(
                          FunctionHelper.iconURL(forecasts.maxTempForecastList[index].iconString),
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) =>
                              const CircularProgressIndicator(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 225.w, top: 20.w),
                      child: Text(
                        '${forecasts.minTempForecastList[index].minTemp}\u00b0',
                        style: AppTextStyles.blueS23W600,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 325.w, top: 20.w),
                      child: Text(
                        '${forecasts.maxTempForecastList[index].maxTemp}\u00b0',
                        style: AppTextStyles.redS23W600,
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
