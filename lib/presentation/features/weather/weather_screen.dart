import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/common/resources/app_colors.dart';
import 'package:weather_app/common/resources/app_text_styles.dart';
import 'package:weather_app/injection/injector.dart';
import 'package:weather_app/presentation/bloc/weather/weather_cubit.dart';
import 'package:weather_app/presentation/enums/loading_status.dart';
import 'package:weather_app/presentation/features/weather/widgets/coming_days_forecast_widget.dart';
import 'package:weather_app/presentation/features/weather/widgets/current_weather_widget.dart';
import 'package:weather_app/presentation/features/weather/widgets/today_forecast_widget.dart';
import 'package:weather_app/router/app_router.dart';
import 'package:weather_app/router/navigator.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key, this.cityName});

  final String? cityName;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherCubit _weatherCubit = injector.get<WeatherCubit>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _weatherCubit.getWeatherByCityName(widget.cityName ?? 'danang');
      _weatherCubit.getForecastByCityName(widget.cityName ?? 'danang');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: Text(
          'Weather',
          style: AppTextStyles.whiteS18W200,
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {
              AppNavigator.pushNamed(RouterName.search);
            },
            icon: const Icon(
              Icons.search,
              color: AppColors.white,
              size: 26,
            ),
          ),
        ],
      ),
      body: BlocConsumer(
        bloc: _weatherCubit,
        listener: (BuildContext context, WeatherState state) {
          // listenAction(state.loadingStatus);
        },
        builder: ((BuildContext context, WeatherState state) {
          return SafeArea(
            child: (state.coordinate != null &&
                    state.weather != null &&
                    state.forecasts != null)
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        CurrentWeatherVerticalWidget(
                          coordinate: state.coordinate!.first,
                          currentWeather: state.weather!,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        TodayForecastWidget(
                          forecasts: state.forecasts!,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        ComingDaysForecastWidget(forecasts: state.forecasts!),
                        (state.isFocus)
                            ? Text(
                                state.cityNameList.first,
                                style: AppTextStyles.whiteS20W400,
                              )
                            : Container()
                      ],
                    ),
                  )
                : const Center(child: CircularProgressIndicator()),
          );
        }),
      ),
    );
  }

  void listenAction(LoadingStatus? loadingStatus) {
    switch (loadingStatus) {
      case LoadingStatus.initial:
        log('initial');
        break;
      case LoadingStatus.loading:
        log('loading');
        break;
      case LoadingStatus.success:
        log('success');
        break;
      case LoadingStatus.failed:
        log('failed');
        break;
      default:
        break;
    }
  }
}
