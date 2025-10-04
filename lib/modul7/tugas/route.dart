import 'package:flutter/material.dart';
import 'package:mobile/modul7/tugas/home.dart';
import 'package:mobile/modul7/tugas/tujuan.dart';

class routePage extends StatelessWidget{
  const routePage ({super.key});

@override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/tujuan': (context) => const tujuan(),
      },
    );
  }
}