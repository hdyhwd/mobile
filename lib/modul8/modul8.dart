import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/main.dart';
import 'package:mobile/modul8/percobaan/home.dart' as percobaan;
import 'package:mobile/modul8/percobaan/tujuan.dart' as percobaan_tujuan;
import 'package:mobile/modul8/tugas/home.dart' as tugas;
import 'package:mobile/modul8/tugas/tujuan.dart' as tugas_tujuan;

class Modul8page extends StatelessWidget {
  const Modul8page({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0081c9)),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Modul 8 - Pilih Mode"),
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
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MaterialApp(
                        debugShowCheckedModeBanner: false,
                        initialRoute: '/',
                        routes: {
                          '/': (context) => const percobaan.Home(),
                          percobaan_tujuan.Tujuan.routeName: (context) =>
                              const percobaan_tujuan.Tujuan(),
                        },
                      ),
                    ),
                  );
                },
                child: const Text("Jalankan Percobaan"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MaterialApp(
                        debugShowCheckedModeBanner: false,
                        initialRoute: '/',
                        routes: {
                          '/': (context) => const tugas.Home(),
                          tugas_tujuan.Tujuan.routeName: (context) =>
                              const tugas_tujuan.Tujuan(),
                        },
                      ),
                    ),
                  );
                },
                child: const Text("Jalankan Tugas"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
