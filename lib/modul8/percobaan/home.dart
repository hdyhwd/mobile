import 'package:flutter/material.dart';
import 'package:mobile/modul8/modul8.dart';
import 'tujuan.dart';
import 'screen_argument.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Home'),
      leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Modul8page()),
            );
          },
        ),     
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Ini halaman Home', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 15),
            OutlinedButton(
              onPressed: () {
                final args = ScreenArguments(
                  'Judul Game',
                  'Genre: Action',
                  'Ini adalah deskripsi singkat dari game.',
                );
                Navigator.pushNamed(context, Tujuan.routeName, arguments: args);
              },
              child: const Text('Ke Halaman Tujuan'),
            ),
          ],
        ),
      ),
    );
  }
}
