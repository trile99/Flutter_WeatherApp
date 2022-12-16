import 'package:flutter/material.dart';
import 'package:own_inbox_app/app.dart';
import 'package:own_inbox_app/config/evn_config.dart';
import 'package:own_inbox_app/injection/evn_injection.dart';
import 'package:own_inbox_app/injection/injector.dart';

void mainBase(EnvConfig env) async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvInjection.inject(env);
  await initDependenciesInjection();
  runApp(const MyApp());
}
