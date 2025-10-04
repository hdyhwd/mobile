import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class TasbihPage extends StatefulWidget {
  const TasbihPage({super.key});

  @override
  State<TasbihPage> createState() => _TasbihPageState();
}

class _TasbihPageState extends State<TasbihPage> {
  late ValueNotifier<double> _valueNotifier;
  late double counter;

  @override
  void initState() {
    super.initState();
    _valueNotifier = ValueNotifier(0.0);
    counter = 0.0;
  }

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  void incrementCounter() {
    setState(() {
      if (counter < 33) {
        counter++;
        _valueNotifier.value = (counter / 33) * 100;
      }
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0.0;
      _valueNotifier.value = (counter / 33) * 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasbih Digital"),
        backgroundColor: const Color.fromARGB(255, 119, 210, 145),
      ),
      backgroundColor: const Color.fromARGB(255, 119, 210, 145),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Hitungan angka kecil
              Text(
                '${(counter.round())}',
                style: const TextStyle(fontSize: 50, color: Colors.white),
              ),
              const SizedBox(height: 20),

              // Circular progress
              SimpleCircularProgressBar(
                progressColors: [Colors.amberAccent.shade400],
                size: 300,
                progressStrokeWidth: 20,
                backStrokeWidth: 10,
                mergeMode: true,
                maxValue: 100,
                animationDuration: 0,
                valueNotifier: _valueNotifier,
                onGetText: (value) {
                  return Text(
                    '${(value.toInt() / 3).round()}',
                    style: const TextStyle(
                      fontSize: 170,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  );
                },
              ),

              const SizedBox(height: 50),

              // Tombol besar fingerprint
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: InkWell(
                  onTap: incrementCounter,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(color: Colors.white),
                    child: const Icon(
                      Icons.fingerprint,
                      size: 125,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // Tombol reset
      floatingActionButton: FloatingActionButton(
        onPressed: resetCounter,
        backgroundColor: Colors.red,
        child: const Icon(Icons.refresh_outlined),
      ),
    );
  }
}
