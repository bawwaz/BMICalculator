import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BMI(title: 'Body Weight Calculator'),
    );
  }
}

class BMI extends StatefulWidget {
  const BMI({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  String bmiResult = '';
  String bmiStatus = '';

  void resetFields() {
    heightController.clear();
    weightController.clear();
    setState(() {
      bmiResult = '';
      bmiStatus = '';
    });
  }

  void calculateBMI() {
    double height = double.tryParse(heightController.text) ?? 0.0;
    double weight = double.tryParse(weightController.text) ?? 0.0;

    if (height > 0 && weight > 0) {
      double bmi = weight / ((height / 100 * (height / 100)));
      bmiResult = 'Your BMI is ${bmi.toStringAsFixed(2)}';
      bmiStatus = getBMIStatus(bmi);
    } else {
      bmiResult = 'Please enter valid height and weight values.';
      bmiStatus = '';
    }
  }

  String getBMIStatus(double bmi) {
    if (bmi < 18.5) {
      return 'You are Underweight';
    } else if (bmi < 24.9) {
      return 'You have the Ideal weight';
    } else if (bmi < 29.9) {
      return 'You are Overweight';
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Height (cm)'),
            ),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Weight (kg)'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  calculateBMI();
                });
              },
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 16),
            Text(
              bmiResult,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              bmiStatus,
              style: TextStyle(fontSize: 18),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: resetFields,
                  child: Text("Reset"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
