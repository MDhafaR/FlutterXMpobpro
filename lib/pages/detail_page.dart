import 'package:flutter/material.dart';
import 'package:flutter_x_mobpro/Color/color_tamplate.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset("assets/logo.png"),
          backgroundColor: ColorTamplate.primaryColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset("assets/dummy.png"),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ini Ajaa",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: ColorTamplate.primaryColor)),
                        Text("40000",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: ColorTamplate.teksTebal)),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text("10000 / hari",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ColorTamplate.primaryColor)),
                const SizedBox(
                  height: 20,
                ),
                Text.rich(
                  TextSpan(
                      style: TextStyle(
                          fontSize: 20, color: ColorTamplate.teksTebal),
                      text: "Barang Pinjaman : ",
                      children: [
                        TextSpan(
                            style: TextStyle(
                                fontSize: 20,
                                color: ColorTamplate.primaryColor),
                            text: " Sunlight")
                      ]),
                ),
                const SizedBox(
                  height: 18,
                ),
                Text("Deskripsi :",
                    style: TextStyle(
                        fontSize: 20, color: ColorTamplate.teksTebal)),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 250,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorTamplate.primaryColor)),
                  child: Text(
                      "Si Ajaa ini teman sekolah dulu, saya kenal dia dari sejak smp sesekolah dan sma pun selalu bersama selalu. pokoknya banyak lah ya yang bisa diingat dari si jaki ini."
                      , style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: ColorTamplate.primaryColor)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text.rich(
                  TextSpan(
                      style: TextStyle(
                          fontSize: 20, color: ColorTamplate.teksTebal),
                      text: "Kontak : ",
                      children: [
                        TextSpan(
                            style: TextStyle(
                                fontSize: 20,
                                color: ColorTamplate.primaryColor),
                            text: " 081234567892")
                      ]),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text.rich(
                  TextSpan(
                      style: TextStyle(
                          fontSize: 20, color: ColorTamplate.teksTebal),
                      text: "Tanggal Pinjam : ",
                      children: [
                        TextSpan(
                            style: TextStyle(
                                fontSize: 20,
                                color: ColorTamplate.primaryColor),
                            text: " 20 - 12 - 2024")
                      ]),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text.rich(
                  TextSpan(
                      style: TextStyle(
                          fontSize: 20, color: ColorTamplate.teksTebal),
                      text: "Tanggal Tempo : ",
                      children: [
                        TextSpan(
                            style: TextStyle(
                                fontSize: 20,
                                color: ColorTamplate.primaryColor),
                            text: " 20 - 12 - 2024")
                      ]),
                ),
              ],
            ),
          ),
        ));
  }
}
