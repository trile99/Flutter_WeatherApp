import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/app.dart';
import 'package:weather_app/config/evn_config.dart';
import 'package:weather_app/injection/evn_injection.dart';
import 'package:weather_app/injection/injector.dart';

void mainBase(EnvConfig env) async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvInjection.inject(env);
  await initDependenciesInjection();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}
