
import 'package:weather_app/data/api/weather_api.dart';
import 'package:weather_app/data/models/current_weather_response.dart';
import 'package:weather_app/data/models/forecast_day_model.dart';

class WeatherRepo {

  WeatherApi api;

  WeatherRepo(this.api);

  Future<CurrentWeatherResponse?> getCurrentWeather(String city) async {
    CurrentWeatherResponse? response = await api.getCurrentWeather(city);
    return response;
  }

  Future<List<ForecastDayModel>> getForecast(String city, int days) async {
    List<ForecastDayModel> forecastDays = await api.getForecast(city, days);
    return forecastDays;
   }
}