import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:own_inbox_app/injection/injector.dart';
import 'package:own_inbox_app/presentation/bloc/weather/weather_cubit.dart';
import 'package:own_inbox_app/presentation/enums/loading_status.dart';

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
      body: BlocConsumer(
        bloc: _weatherCubit,
        listener: (BuildContext context, WeatherState state) {
          listenAction(state.loadingStatus);
        },
        builder: ((BuildContext context, WeatherState state) {
          final String cityName = state.coordinate?.first.localName?.en ?? '';
          final String temp =
              '${state.weather?.main?.temp?.round()}\u00B0' ?? '';
          final String main = state.weather?.forecast?.first.main ?? '';
          final int maxTemp = state.weather?.main?.tempMax?.round() ?? 0;
          final int lowTemp = state.weather?.main?.tempMin?.round() ?? 0;
          final String highAndLowTemp = 'H:$maxTemp\u00B0 L:$lowTemp\u00B0';

          return SafeArea(
            child: Center(
              child: Column(
                children: [
                  Text(cityName),
                  Image.network(
                      'http://openweathermap.org/img/wn/${state.weather?.forecast?.first.icon}@2x.png'),
                  Text(temp),
                  Text(main),
                  Text(highAndLowTemp),
                ],
              ),
            ),
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

// Future<Joke?> getCoordinate(String category) async {
//   return await _weatherCubit.getCoordinate(category);
// }
}
