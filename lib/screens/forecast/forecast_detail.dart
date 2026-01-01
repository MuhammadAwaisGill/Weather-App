import 'package:flutter/material.dart';
import 'package:weather_app/data/models/forecast_day_model.dart';

class ForecastDetailScreen extends StatelessWidget {
  final ForecastDayModel day;

  const ForecastDetailScreen({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(day.date ?? "Details")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: day.hour?.length ?? 0,
        itemBuilder: (context, index) {
          final hour = day.hour![index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Image.network(
                "https:${hour.condition?.icon ?? ''}",
                width: 40,
                height: 40,
                errorBuilder: (c, e, s) => const Icon(Icons.cloud),
              ),
              title: Text("${hour.time ?? ''}"),
              subtitle: Text(
                "${hour.condition?.text ?? ''}\nTemp: ${hour.tempC ?? '--'}°C",
              ),
            ),
          );
        },
      ),
    );
  }
}
