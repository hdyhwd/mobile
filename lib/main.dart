import 'package:flutter/material.dart';
import 'package:mobile/modul7/modul7.dart';
import 'package:mobile/modul8/modul8.dart';
import 'package:mobile/modul9/modul9.dart';
import 'package:mobile/modul10/callall.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Flutter',
      home: MyHomePage(), // Pisahkan HomePage supaya context benar
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MODUL 5')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Modul7Page()),
              );
            },
            child: Text('modul 7'),
          ),

          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => (Modul8page())),
              );
            },
            child: Text('Modul 8'),
          ),

          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Modul9Page()),
              );
            },
            child: Text('modul 9'),
          ),

          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Modul10prac()),
              );
            },
            child: const Text('Modul 10'),
          ),
        ],
      ),
    );
  }
}
