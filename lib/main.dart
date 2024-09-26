import 'dart:math'; // Library for random weather degrees
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), // Set color to blue
        scaffoldBackgroundColor: Colors.black, // Black background
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue, // Blue app bar
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white), // Default body text color
          bodySmall: TextStyle(color: Colors.white), // Additional body text style
          displayMedium: TextStyle(color: Colors.white), // Headline text color
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Weather App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _cityName = '';
  String _weatherData = 'Enter a city to fetch weather';

  final TextEditingController _controller = TextEditingController();
  final Random _random = Random();

  // Simulate weather forecast
  void _fetchWeather() {
    setState(() {
      _cityName = _controller.text;

      // Generate random temperature between 15°C and 30°C
      int temperature = 15 + _random.nextInt(16);

      // List of possible weather conditions
      List<String> conditions = ['Sunny', 'Cloudy', 'Rainy'];
      String weatherCondition = conditions[_random.nextInt(conditions.length)];

      // Update weather data string
      _weatherData = 'The Weather in CITY: $_cityName TEMPERATURE: $temperature°C, WEATHER: $weatherCondition';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              style: TextStyle(color: Colors.white), // Text color in TextField
              decoration: InputDecoration(
                labelText: 'Enter City Name',
                labelStyle: TextStyle(color: Colors.white), // Label color
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), // Border color
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: const Text('Fetch Weather'),
            ),
            const SizedBox(height: 16),
            // Display the weather information
            Text(
              _weatherData,
              style: Theme.of(context).textTheme.displayMedium, 
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
