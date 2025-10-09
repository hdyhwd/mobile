import 'package:flutter/material.dart';
import 'package:mobile/modul10/view/detail.dart';
import 'package:mobile/modul10/view/home.dart';

class Modul10prac extends StatelessWidget {
  const Modul10prac({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Game Store',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeGame(),
        '/detail': (context) {
          final gameId = ModalRoute.of(context)!.settings.arguments as int;
          return Detail(gameTerpilih: gameId);
        },
      },
      theme: ThemeData(primarySwatch: Colors.amber),
    );
  }
}
