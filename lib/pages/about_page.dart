import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tentang Aplikasi"),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Hitung BMI merupakan sebuah aplikasi Android untuk menghitung"
                  " body mass index (BMI) sehingga seseorang dapat mengetahui apakah "
                  "berat badannya ideal, gemuk atau kurus.",
                  style: TextStyle(fontSize: 16)),
              SizedBox(
                height: 16,
              ),
              Text("Aplikasi ini dibuat untuk saya hehe",
                  style: TextStyle(fontSize: 16)),
              SizedBox(
                height: 16,
              ),
              Text(
                  "Copyright © 2024 Muhammad Dhafa Ramadhani.\nAll rights reserved",
                  style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
