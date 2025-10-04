import 'package:flutter/material.dart';
import 'package:mobile/modul7/percobaan1/home.dart';

class route1 extends StatelessWidget {
  const route1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}