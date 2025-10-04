import 'package:flutter/material.dart';
import 'package:mobile/main.dart';
import 'package:mobile/modul9/perobaan1.dart';
import 'package:mobile/modul9/tugas/tasbih.dart'; // pastikan ada CounterPage atau TasbihPage

class Modul9Page extends StatelessWidget {
  const Modul9Page({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Modul 9 - Pilih Mode"),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CounterPage(), // pastikan ada
                    ),
                  );
                },
                child: const Text('Percobaan 1 (jangan marah)'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TasbihPage(),
                    ),
                  );
                },
                child: const Text('tugas (Tasbih Digital)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
