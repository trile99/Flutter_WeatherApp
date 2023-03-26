import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/common/resources/app_colors.dart';
import 'package:weather_app/common/resources/app_text_styles.dart';
import 'package:weather_app/domain/entities/forecast/forecasts.dart';
import 'package:weather_app/presentation/features/weather/widgets/horizontal_list_view_widget.dart';

class TodayForecastWidget extends StatelessWidget {
  const TodayForecastWidget({
    Key? key,
    required this.forecasts,
  }) : super(key: key);

  final Forecasts forecasts;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.lightBlack,
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                'Today Forecast',
                style: AppTextStyles.whiteS20W600,
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Divider(color: AppColors.white.withOpacity(0.5)),
            ),
            HorizontalListViewWidget(forecastList: forecasts.todayForecastList),
          ],
        ),
      ),
    );
  }
}
