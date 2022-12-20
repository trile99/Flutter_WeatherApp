import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/injection/injector.dart';
import 'package:weather_app/presentation/bloc/weather/weather_cubit.dart';
import 'package:weather_app/presentation/enums/loading_status.dart';
import 'package:weather_app/presentation/features/weather/widgets/current_weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherCubit _weatherCubit = injector.get<WeatherCubit>();

  final String image = '03d';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _weatherCubit.getWeather();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Colors.purple, Colors.blue],
          ),
        ),
        child: BlocConsumer(
          bloc: _weatherCubit,
          listener: (BuildContext context, WeatherState state) {
            listenAction(state.loadingStatus);
          },
          builder: ((BuildContext context, WeatherState state) {
            return SafeArea(
              child: Center(
                child: (state.coordinate != null && state.weather != null)
                    ? CurrentWeather(
                        coordinate: state.coordinate!.first,
                        weather: state.weather!,
                      )
                    : const CircularProgressIndicator(),
              ),
            );
          }),
        ),
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
