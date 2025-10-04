import 'package:flutter/material.dart';

class tujuan extends StatelessWidget {
  const tujuan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(title: Text("Tugas Praktikum modul 7")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "ada orang suka marah dan kesel ga jelas, ntahlah ya dia itu selalu marah dan kesel tapi ga bilang, biasa mah nammnya juga bocil 05",
            ),
            Center(
              child: Image.network('https://picsum.photos/250?image=9'),
            ),
            Text("tujuan ku ya kamu, mau nulis apa lah aku ya bingung isi dari teksnya "),
            
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 243, 114, 33),
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text("Ke Halaman home"),
            ),
          ],
        ),
      ),
    );
  }
}
