import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/home.dart';


class modul11page extends StatelessWidget {
  const modul11page({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasbih Digital GetX',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}
