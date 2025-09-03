// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      title: "Even Odd",
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController numbercontroller = TextEditingController();

  var result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Even Odd'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Enter your number', style: TextStyle(fontSize: 20)),
            ),
            TextField(
              controller: numbercontroller,
              decoration: InputDecoration(
                labelText: 'Enter your number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  result = calculate();
                });
              },
              child: Text('click me'),
            ),
            Text(result, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }

  String calculate() {
    var mydata = numbercontroller.text;
    print(mydata);

    int? number = int.tryParse(mydata);

    if (number == null) {
      return 'Please enter a valid number';
    }

    if (number % 2 == 0) {
      return 'The number is even';
    } else {
      return 'The number is odd';
    }
  }
}
