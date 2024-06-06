import 'package:flutter/material.dart';
import 'package:flutter_x_mobpro/Color/color_tamplate.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mobpro 1"), backgroundColor: ColorTamplate().primaryColor,),
      body: Center(),
    );
  }
}