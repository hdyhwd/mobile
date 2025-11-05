import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/modul12/gps.dart';

class Modul12 extends StatelessWidget {
  const Modul12({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lokasi Saya',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: const GeolocationScreen(),
    );
  }
}
