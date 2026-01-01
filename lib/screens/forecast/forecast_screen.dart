import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/forecast/forecast_provider.dart';

import 'forecast_detail.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ForecastProvider>(
      builder: (context, provider, child) {
        if (provider.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (provider.forecastDays.isEmpty) {
          return const Center(child: Text("No forecast data available"));
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("Weather Forecast"),
            centerTitle: true,
          ),
          body: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: provider.forecastDays.length,
            itemBuilder: (context, index) {
              final day = provider.forecastDays[index];

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ForecastDetailScreen(day: day),
                      ),
                    );
                  },
                  leading: Image.network(
                    "https:${day.day?.condition?.icon ?? ''}",
                    width: 50,
                    height: 50,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.cloud),
                  ),
                  title: Text(
                    day.date ?? "",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "${day.day?.condition?.text ?? ''}\nAvg Temp: ${day.day?.avgtempC ?? '--'}°C",
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
