import 'package:flutter/material.dart';
import 'package:mobile/main.dart';
import 'package:mobile/modul7/percobaan1/route.dart';
import 'package:mobile/modul7/percobaan2/route.dart';
import 'package:mobile/modul7/tugas/route.dart';

class Modul7Page extends StatelessWidget {
  const Modul7Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('lama'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => route1()),
                );
              },
              child: const Text('Percobaan 1 (jangan marah)'),
            ),

            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => route2()),
                );
              },
              child: const Text('Percobaan 2 (marah")'),
            ),

            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => routePage()),
                );
              },
              child: const Text('tugas'),
            ),
          ],
        ),
      ),
    );
  }
}
