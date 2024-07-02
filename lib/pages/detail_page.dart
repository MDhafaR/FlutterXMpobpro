import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_x_mobpro/Color/color_tamplate.dart';
import 'package:flutter_x_mobpro/bloc/barang_bloc.dart';
import 'package:flutter_x_mobpro/models/barang.dart';

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
        body: BlocBuilder<BarangBloc, BarangState>(
          builder: (context, state) {
            List<Barang> datanya = [];
            if (state is BarangSuccess) {
              datanya = state.totalBarang;
            }
            return SingleChildScrollView(
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
                            Text(datanya[0].namaLengkap!,
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: ColorTamplate.primaryColor)),
                            Text("${datanya[0].hargaPerHari!}",
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
                    Text("${datanya[0].hargaPerHari!} / hari",
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
                                text: " ${datanya[0].barangPinjaman!}")
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
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: ColorTamplate.primaryColor)),
                      child: Text(
                          datanya[0].deskripsi!,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ColorTamplate.primaryColor)),
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
                                text: " ${datanya[0].kontak!}")
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
                                text: " ${datanya[0].tanggalPinjam!}")
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
                                text: " ${datanya[0].tanggalTempo!}")
                          ]),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
