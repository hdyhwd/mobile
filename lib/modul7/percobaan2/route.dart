import 'package:flutter/material.dart';
import 'package:mobile/modul7/percobaan2/home.dart';
import 'package:mobile/modul7/percobaan2/tujuan.dart';

class route2 extends StatelessWidget {
  const route2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/tujuan': (context) => const TujuanPage(),
      },
    );
  }
}