
import 'package:flutter/material.dart';
import 'package:weather_app/data/repository/weather_repo.dart';

class WeatherProvider with ChangeNotifier {
  WeatherRepo repo;

  WeatherProvider(this.repo);

  getCurrentWeather(String city) async {
    await repo.getCurrentWeather(city);
  }
}