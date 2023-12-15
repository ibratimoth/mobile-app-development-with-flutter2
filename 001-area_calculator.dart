import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CircleAreaCalculator(),
    );
  }
}

class CircleAreaCalculator extends StatefulWidget {
  @override
  _CircleAreaCalculatorState createState() => _CircleAreaCalculatorState();
}

class _CircleAreaCalculatorState extends State<CircleAreaCalculator> {
  TextEditingController radiusController = TextEditingController();
  double area = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Area Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: radiusController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Radius (in meters)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                calculateArea();
              },
              child: Text('CALCULATE'),
            ),
          ],
        ),
      ),
    );
  }

  void calculateArea() {
    double radius = double.tryParse(radiusController.text) ?? 0.0;
    double calculatedArea = 3.14159 * radius * radius;

    setState(() {
      area = calculatedArea;
    });

    showResultDialog();
  }

  void showResultDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Information'),
          content: Text('The area of the circle is $area m2.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}