import 'package:flutter/material.dart';
import 'package:mobile/modul10/callall.dart';
import 'package:mobile/modul11/modul11.dart';
import 'package:mobile/modul7/modul7.dart';
import 'package:mobile/modul8/modul8.dart';
import 'package:mobile/modul9/perobaan1.dart'; // misalnya ini file Modul8Page kamu

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
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Modul'),
        centerTitle: true,
      ),
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
          ],
        ),
      ),
    );
  }
}
