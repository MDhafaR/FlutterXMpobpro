import 'package:flutter/material.dart';
import 'package:flutter_x_mobpro/Color/color_tamplate.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/logo.png"),
        backgroundColor: ColorTamplate.primaryColor,
        actions: [
          IconButton(
              onPressed: () {}, icon: Image.asset("assets/tambahObjPutih.png"))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tambahkan\nData Baru",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: ColorTamplate.primaryColor),
              textAlign: TextAlign.center,
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset("assets/tambahObject.png"),
              iconSize: 73,
            ),
          ],
        ),
      ),
    );
  }
}
