import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/common/resources/app_colors.dart';
import 'package:weather_app/common/resources/app_text_styles.dart';
import 'package:weather_app/injection/injector.dart';
import 'package:weather_app/presentation/bloc/weather/weather_cubit.dart';
import 'package:weather_app/presentation/enums/loading_status.dart';
import 'package:weather_app/presentation/features/weather/widgets/current_weather_widget.dart';
import 'package:weather_app/router/app_router.dart';
import 'package:weather_app/router/navigator.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final WeatherCubit _weatherCubit = injector.get<WeatherCubit>();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Weather',
                  style: AppTextStyles.whiteS30W600,
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 40,
                  child: TextField(
                    style: AppTextStyles.whiteS20W400,
                    controller: _controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.darkGrey,
                      contentPadding: const EdgeInsets.all(8),
                      isDense: true,
                      prefixIcon: const Icon(Icons.search, size: 26),
                      prefixIconColor: AppColors.grey,
                      enabledBorder: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      hintText: 'Search for a city',
                      hintStyle: AppTextStyles.greyS20W400,
                    ),
                    onSubmitted: (value) {
                      _weatherCubit.searchWeatherByCityName(_controller.text);
                    },
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                BlocBuilder<WeatherCubit, WeatherState>(
                  bloc: _weatherCubit,
                  builder: (context, state) {
                    if (state.loadingStatus == LoadingStatus.success) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.weatherList!.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              _weatherCubit.updateDisplayWeatherByCoordinate(
                                  state.coordinateList![index] );
                              AppNavigator.pushNamed(RouterName.weather,
                                  arguments: state.coordinateList![index]);
                            },
                            child: CurrentWeatherHorizontalWidget(
                              coordinate: state.coordinateList![index],
                              currentWeather: state.weatherList![index],
                              widgetColor: index % 2 == 0
                                  ? AppColors.red
                                  : AppColors.blue,
                            ),
                          );
                        },
                      );
                    }
                    if (state.loadingStatus == LoadingStatus.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
