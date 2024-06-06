import 'package:flutter/material.dart';
import 'package:flutter_x_mobpro/model/hewan.dart';
import 'package:flutter_x_mobpro/pages/halaman_utama.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  List<Hewan> data = [
    Hewan(nama: "ayam", image: "assets/ayam.jpg"),
    Hewan(nama: "bebek", image: "assets/bebek.jpg"),
    Hewan(nama: "domba", image: "assets/domba.jpg"),
    Hewan(nama: "kambing", image: "assets/kambing.jpg"),
    Hewan(nama: "sapi", image: "assets/sapi.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HalamanUtama(data),
    );
  }
}
