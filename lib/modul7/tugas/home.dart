import 'package:flutter/material.dart';
import 'package:mobile/modul7/modul7.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(title: const Text("Tugas Praktikum modul 7"),
      leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Modul7Page()),
            );
          },
        ),     
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "ada orang suka marah dan kesel ga jelas, ntahlah ya dia itu selalu marah "
              "dan kesel tapi ga bilang, biasa mah nammnya juga bocil 05",
              textAlign: TextAlign.left, // biar rapi
            ),

            Image.network(
              'https://picsum.photos/250?image=9',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),

            const Text(
              ";lhvcbdfyiudkwnlbdskgjhkj;wl;erkm;nkbtlgrjnra.elkdm nvekbje,.nlikdnkgbhjg",
              textAlign: TextAlign.left,
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/tujuan');
              },
              child: const Text("Ke Halaman Tujuan"),
            ),
          ],
        ),
      ),
    );
  }
}
