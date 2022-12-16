import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:own_inbox_app/presentation/features/weather/weather_screen.dart';
import 'package:own_inbox_app/router/app_router.dart';
import 'package:own_inbox_app/router/navigator.dart';

import 'generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}
