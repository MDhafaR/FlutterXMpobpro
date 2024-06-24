import 'package:flutter/material.dart';
import 'package:flutter_x_mobpro/models/lampu.dart';
import 'package:flutter_x_mobpro/pages/halaman_utama.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final List<Lampu> data = [
    Lampu(image: "assets/on.png", kondisi: "Lampu Hidup", tombolText: "Matikan"),
    Lampu(image: "assets/off.png", kondisi: "Lampu Mati", tombolText: "Hidupkan")
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HalamanUtama(data),
    );
  }
}
