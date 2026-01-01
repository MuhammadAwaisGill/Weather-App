import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/forecast/forecast_provider.dart';
import 'package:weather_app/data/models/forecast_day_model.dart';

class CurrentWeatherScreen extends StatelessWidget {
  const CurrentWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ForecastProvider>(context);

    if (provider.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.forecastDays.isEmpty) {
      return const Center(child: Text("No current weather data"));
    }

    ForecastDayModel today = provider.forecastDays.first;

    return Scaffold(
      appBar: AppBar(title: const Text("Today's Weather")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https:${today.day?.condition?.icon ?? ''}",
              width: 100,
              height: 100,
              errorBuilder: (context, error, stack) =>
              const Icon(Icons.cloud, size: 60),
            ),
            const SizedBox(height: 16),
            Text(
              today.day?.condition?.text ?? "Clear",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              "Avg Temp: ${today.day?.avgtempC ?? '--'}°C",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text("Date: ${today.date ?? ''}"),
          ],
        ),
      ),
    );
  }
}
