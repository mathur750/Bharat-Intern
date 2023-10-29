import 'package:flutter/material.dart';

void main() {
  runApp(TemperatureConverterApp());
}

class TemperatureConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TemperatureConverter(),
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  TextEditingController celsiusController = TextEditingController();
  TextEditingController fahrenheitController = TextEditingController();

  void convertCelsiusToFahrenheit() {
    double celsius = double.tryParse(celsiusController.text) ?? 0.0;
    double fahrenheit = (celsius * 9 / 5) + 32;
    fahrenheitController.text = fahrenheit.toStringAsFixed(2);
  }

  void convertFahrenheitToCelsius() {
    double fahrenheit = double.tryParse(fahrenheitController.text) ?? 0.0;
    double celsius = (fahrenheit - 32) * 5 / 9;
    celsiusController.text = celsius.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: celsiusController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Celsius',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: convertCelsiusToFahrenheit,
              child: Text('Convert to Fahrenheit'),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: fahrenheitController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Fahrenheit',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: convertFahrenheitToCelsius,
              child: Text('Convert to Celsius'),
            ),
          ],
        ),
      ),
    );
  }
}
