import 'package:flutter/material.dart';
import 'package:mobile/modul10/callall.dart';
import 'package:mobile/modul11/modul11.dart';
import 'package:mobile/modul12/modul12.dart';
import 'package:mobile/modul7/modul7.dart';
import 'package:mobile/modul8/modul8.dart';
import 'package:mobile/modul9/perobaan1.dart';
import 'package:mobile/modul13/crud.dart';
import 'package:mobile/Gps/mylocation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Flutter',
      debugShowCheckedModeBanner: false,
      home: const HomePage(), // halaman utama
      routes: {
        '/modul7': (context) => const Modul7Page(),
        '/modul8': (context) => const Modul8page(),
        '/modul9': (context) => const CounterPage(),
        '/modul10': (context) => const Modul10prac(),
        '/modul11': (context) => const modul11page(),
        '/modul12': (context) => const Modul12(),
        '/modul13': (context) => const crud(),
        '/GPS': (context) => const GPS(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu Modul'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/modul7');
              },
              child: const Text('Modul 7'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/modul8');
              },
              child: const Text('Modul 8'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/modul9');
              },
              child: const Text('Modul 9'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/modul10');
              },
              child: const Text('Modul 10'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/modul11');
              },
              child: const Text('Modul 11'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/modul12');
              },
              child: const Text('Modul 12'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/modul13');
              },
              child: const Text('Modul 13'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/GPS');
              },
              child: const Text('GPS NOw'),
            ),
          ],
        ),
      ),
    );
  }
}
