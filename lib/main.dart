import 'dart:math'; //library for the random weather degrees
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
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

  // Simulate fetching weather data
  void _fetchWeather() {
    setState(() {
      _cityName = _controller.text;

      // Generate random temperature between 15°C and 30°C
      int temperature = 15 + _random.nextInt(16);

      // List of possible weather conditions
      List<String> conditions = ['Sunny', 'Cloudy', 'Rainy'];
      String weatherCondition = conditions[_random.nextInt(conditions.length)];

      // Update weather data string
      _weatherData = 'Weather in CITY:$_cityName TEMPERATURE:$temperature°C, WEATHER:$weatherCondition';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter City Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: const Text('Fetch Weather'),
            ),
            const SizedBox(height: 16),
            // Display the simulated weather information
            Text(
              _weatherData,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
