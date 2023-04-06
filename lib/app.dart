import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/common/resources/app_strings.dart';
import 'package:weather_app/presentation/features/weather/weather_screen.dart';
import 'package:weather_app/router/app_router.dart';
import 'package:weather_app/router/navigator.dart';

import 'generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MaterialApp(
            home: const WeatherScreen(),
            debugShowCheckedModeBanner: false,
            navigatorKey: AppNavigator.navigatorKey,
            onGenerateRoute: AppRoutes.onGenerateRoutes,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback:
                (Locale? locale, Iterable<Locale> supportedLocales) {
              for (final Locale supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale?.languageCode) {
                  AppStrings.appLocale = supportedLocale.languageCode;
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
            supportedLocales: S.delegate.supportedLocales,
          ),
        );
      },
    );
  }
}
