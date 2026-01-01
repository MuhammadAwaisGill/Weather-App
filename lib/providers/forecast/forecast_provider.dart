
import 'package:flutter/cupertino.dart';
import 'package:weather_app/data/models/forecast_day_model.dart';
import 'package:weather_app/data/repository/weather_repo.dart';

class ForecastProvider with ChangeNotifier{
  WeatherRepo repo;
  List<ForecastDayModel> forecastDays = [];
  bool loading = false;

  ForecastProvider(this.repo) {
    getForecast();
  }
  getForecast() async {
    loading = true;
    notifyListeners();
    forecastDays = await repo.getForecast('Lahore', 7);
    loading = false;
    notifyListeners();
  }
}