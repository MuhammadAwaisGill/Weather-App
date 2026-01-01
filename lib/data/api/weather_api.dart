
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/data/models/current_weather_response.dart';
import 'package:weather_app/data/models/forecast_day_model.dart';

class WeatherApi {
  String baseUrl = 'http://api.weatherapi.com/v1';

  Future<CurrentWeatherResponse?> getCurrentWeather(String city) async {
    try {
      final res = await http.get(Uri.parse('$baseUrl/forecast.json?key=e9d3a48e80dd412395544121251810&q=$city&days=1&aqi=no&alerts=no'));
      final data = jsonDecode(res.body);
      CurrentWeatherResponse response = CurrentWeatherResponse.fromJson(data);
      return response;
    }
    catch (e) {
      print(e);
    }
    return null;
  }
  
  Future<List<ForecastDayModel>> getForecast(String city, int days) async {
    try {
      final res = await http.get(Uri.parse("$baseUrl/forecast.json?key=e9d3a48e80dd412395544121251810&q=$city&days=$days&aqi=no&alerts=no"));
      final data = jsonDecode(res.body);
      List dataList = data['forecast']['forecastday'];
      List<ForecastDayModel> forecastDays =dataList.map((e) => ForecastDayModel.fromJson(e)).toList();
      return forecastDays;
    }catch(e) {
      print(e);
    }
    return [];
  }
}