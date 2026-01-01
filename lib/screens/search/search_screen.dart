import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/search/search_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<SearchProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(title: const Text("Search City")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Autocomplete<String>(
                      optionsBuilder: (TextEditingValue value) {
                        if (value.text.isEmpty) return const Iterable<String>.empty();
                        final cities = ['London', 'Lahore', 'New York', 'Tokyo', 'Karachi', 'Paris', 'Dubai'];
                        return cities.where((city) =>
                            city.toLowerCase().startsWith(value.text.toLowerCase()));
                      },
                      onSelected: (String selection) {
                        _controller.text = selection;
                        Provider.of<SearchProvider>(context, listen: false)
                            .searchCity(selection);
                      },
                      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
                        _controller.text = controller.text;
                        return TextField(
                          controller: controller,
                          focusNode: focusNode,
                          decoration: const InputDecoration(
                            hintText: "Enter city name",
                            border: OutlineInputBorder(),
                          ),
                          onSubmitted: (_) => onFieldSubmitted(),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<SearchProvider>(context, listen: false)
                          .searchCity(_controller.text.trim());
                    },
                    child: const Text("Search"),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              if (provider.loading) const CircularProgressIndicator(),

              if (!provider.loading && provider.result != null)
                Column(
                  children: [
                    ListTile(
                      title: const Text("Name"),
                      trailing: Text(provider.result?.location?.name ?? ""),
                    ),
                    ListTile(
                      title: const Text("Region"),
                      trailing: Text(provider.result?.location?.region ?? ""),
                    ),
                    ListTile(
                      title: const Text("Country"),
                      trailing: Text(provider.result?.location?.country ?? ""),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("Temperature (°C)"),
                      trailing: Text(provider.result?.current?.tempC.toString() ?? ""),
                    ),
                    ListTile(
                      title: const Text("Condition"),
                      trailing: Text(provider.result?.current?.condition?.text ?? ""),
                      leading: Image.network(
                        provider.result?.current?.condition?.icon
                            ?.replaceFirst('//', 'https://') ??
                            "",
                        width: 48,
                        height: 48,
                        errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.image_not_supported),
                      ),
                    ),
                    ListTile(
                      title: const Text("Wind Speed (Kph)"),
                      trailing: Text(provider.result?.current?.windKph?.toString() ?? ""),
                    ),
                    ListTile(
                      title: const Text("Cloud"),
                      trailing: Text(provider.result?.current?.cloud?.toString() ?? ""),
                    ),
                  ],
                ),

              if (!provider.loading && provider.result == null)
                const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
