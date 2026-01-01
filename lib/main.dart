import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/api/weather_api.dart';
import 'package:weather_app/data/repository/weather_repo.dart';
import 'package:weather_app/providers/forecast/forecast_provider.dart';
import 'package:weather_app/providers/home/home_provider.dart';
import 'package:weather_app/providers/main/main_provider.dart';
import 'package:weather_app/providers/search/search_provider.dart';
import 'package:weather_app/screens/main/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainProvider()),
        Provider(create: (_) => WeatherApi()),
        Provider(create: (context) => WeatherRepo(context.read<WeatherApi>())),
        ChangeNotifierProvider(
            create: (context) => HomeProvider(context.read<WeatherRepo>())),
        ChangeNotifierProvider(
            create: (context) => ForecastProvider(context.read<WeatherRepo>())),
        ChangeNotifierProvider(
            create: (context) => SearchProvider(context.read<WeatherRepo>())),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
