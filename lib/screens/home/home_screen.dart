
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/home/home_provider.dart';
import '';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider> (
      builder: (context, provider, child) {
        return provider.loading? Center(child: CircularProgressIndicator()):
        Column(
          children: [
            ListTile(
              title: Text("Name"),
              trailing: Text(provider.location?.name?? ""),
            ),
            ListTile(
              title: Text("Region"),
              trailing: Text(provider.location?.region?? ""),
            ),
            ListTile(
              title: Text("Country"),
              trailing: Text(provider.location?.country?? ""),
            ),
            Divider(),
            ListTile(
              title: Text("Temperature(c)"),
              trailing: Text(provider.current?.tempC.toString()?? ""),
            ),
            ListTile(
              title: Text("Condition"),
              trailing: Text(provider.current?.condition?.text?? ""),
              leading: Image.network(provider.current?.condition?.icon?.replaceFirst('//', 'https://')?? ""),
            ),
            ListTile(
              title: Text("Wind Speed (Kph)"),
              trailing: Text(provider.current?.windKph?.toString()?? ""),
            ),
            ListTile(
              title: Text("Cloud"),
              trailing: Text(provider.current?.cloud?.toString()?? ""),
            ),
          ],
        );
      }
    );
  }
}
