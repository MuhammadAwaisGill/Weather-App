# Weather App

A simple weather application built with Flutter that shows real-time weather information and forecasts.

## Features

- Real-time weather data
- Weather forecasts
- Works on Android, iOS, and Web
- Provider for state management

## Technologies Used

- Flutter
- Provider (state management)
- WeatherAPI (http://api.weatherapi.com)

## Setup

1. Clone the repository
```bash
git clone https://github.com/yourusername/weather-app.git
cd weather-app
```

2. Install dependencies
```bash
flutter pub get
```

3. Add your WeatherAPI key in the code (get free key from weatherapi.com)

4. Run the app
```bash
flutter run
```

## Permissions

Make sure you have internet permission in `AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

## Troubleshooting

If app doesn't work on mobile:
- Check internet permission is added
- Rebuild the app: `flutter clean` then `flutter run`
- Check console for errors: `flutter logs`

## License

MIT

## Screenshots

<p align="center">
  <img src="Screenshot 2026-01-01 123706.png" width="250" alt="Screenshot 1"/>
  <img src="Screenshot 2026-01-01 123858.png" width="250" alt="Screenshot 2"/>
  <img src="Screenshot 2026-01-01 123752.png" width="250" alt="Screenshot 3"/>
</p>

<p align="center">
  <img src="Screenshot 2026-01-01 123829.png" width="250" alt="Screenshot 4"/>
  <img src="Screenshot 2026-01-01 123738.png" width="250" alt="Screenshot 5"/>
</p>
