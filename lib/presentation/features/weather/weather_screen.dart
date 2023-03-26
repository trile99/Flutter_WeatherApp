import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/common/resources/app_colors.dart';
import 'package:weather_app/injection/injector.dart';
import 'package:weather_app/presentation/bloc/weather/weather_cubit.dart';
import 'package:weather_app/presentation/enums/loading_status.dart';
import 'package:weather_app/presentation/features/weather/widgets/coming_days_forecast_widget.dart';
import 'package:weather_app/presentation/features/weather/widgets/current_weather_widget.dart';
import 'package:weather_app/presentation/features/weather/widgets/today_forecast_widget.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherCubit _weatherCubit = injector.get<WeatherCubit>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _weatherCubit.getWeather();
      _weatherCubit.getForecast();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: BlocConsumer(
        bloc: _weatherCubit,
        listener: (BuildContext context, WeatherState state) {
          listenAction(state.loadingStatus);
        },
        builder: ((BuildContext context, WeatherState state) {
          return SafeArea(
            child: (state.coordinate != null &&
                    state.weather != null &&
                    state.forecasts != null)
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        CurrentWeatherWidget(
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
                        ComingDaysForecastWidget(forecasts: state.forecasts!)
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
