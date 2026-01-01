import 'package:flutter/material.dart';
import 'package:weather_app/data/models/current_weather_response.dart';
import 'package:weather_app/data/repository/weather_repo.dart';

class SearchProvider with ChangeNotifier {
  final WeatherRepo repo;

  SearchProvider(this.repo);

  bool loading = false;
  CurrentWeatherResponse? result;

  Future<void> searchCity(String city) async {
    if (city.isEmpty) {
      print("Empty city name entered");
      return;
    }

    loading = true;
    notifyListeners();

    print("======== SEARCH STARTED ========");
    print("City entered: $city");

    try {
      result = await repo.getCurrentWeather(city);

      if (result != null) {
        print("City found: ${result!.location.name}");
      } else {
        print("No result found!");
      }
    } catch (e) {
      print("Error calling API: $e");
    }

    loading = false;
    notifyListeners();

    print("======== SEARCH ENDED ========");
  }
}
