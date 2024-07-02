import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_x_mobpro/Color/color_tamplate.dart';
import 'package:flutter_x_mobpro/bloc/barang_bloc.dart';
import 'package:flutter_x_mobpro/models/barang.dart';
import 'package:intl/intl.dart';

class InputScreen extends StatelessWidget {
  InputScreen({super.key});

  final List<String> gender = ["Pria", "Wanita"];

  @override
  Widget build(BuildContext context) {
    String? namaAsli;
    String genderSaatIni = gender[0];
    String? barangPinjaman;
    String? deskripsi;
    String? kontak;
    int? harga;
    String tanggalTerpilih = DateFormat.yMd().format(DateTime.now());
    String tanggalTempoTerpilih = DateFormat.yMd().format(DateTime.now());

    List<Barang> datanya = [];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorTamplate.primaryColor,
          centerTitle: true,
          title: Image.asset("assets/logo.png"),
          actions: [
            InkWell(
              onTap: () {
                datanya.add(Barang(
                    namaLengkap: namaAsli,
                    jenisKelamin: genderSaatIni,
                    barangPinjaman: barangPinjaman,
                    deskripsi: deskripsi,
                    kontak: kontak,
                    hargaPerHari: harga,
                    tanggalPinjam: tanggalTerpilih,
                    tanggalTempo: tanggalTempoTerpilih));
                context.read<BarangBloc>().add(OnSubmit(datanya));
                Navigator.pop(context);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/savePutih.png"),
                  const Text("Save")
                ],
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //? Input Nama Asli
                TextField(
                  onChanged: (value) {
                    namaAsli = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Nama Asli",
                    contentPadding: const EdgeInsets.all(15),
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorTamplate.primaryColor)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(214, 9, 232, 17))),
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),

                //? Input Jenis kelamin
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: ColorTamplate.primaryColor)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12, top: 8),
                        child: Text("Jenis Kelamin",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[700])),
                      ),
                      BlocBuilder<BarangBloc, BarangState>(
                          builder: (context, state) {
                        if (state is GenderState) {
                          genderSaatIni = state.jenisKelamin;
                        }
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IntrinsicWidth(
                              child: RadioListTile(
                                dense: true,
                                value: gender[0],
                                groupValue: genderSaatIni,
                                onChanged: (value) {
                                  context
                                      .read<BarangBloc>()
                                      .add(ChangeGender(value.toString()));
                                },
                                title: Text(
                                  "Laki - laki",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: ColorTamplate.primaryColor,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.all(0),
                                visualDensity:
                                    const VisualDensity(horizontal: -4),
                                activeColor: ColorTamplate.primaryColor,
                                fillColor: MaterialStateProperty.all(
                                    ColorTamplate.primaryColor),
                              ),
                            ),
                            IntrinsicWidth(
                              child: RadioListTile(
                                value: gender[1],
                                groupValue: genderSaatIni,
                                onChanged: (value) {
                                  context
                                      .read<BarangBloc>()
                                      .add(ChangeGender(value.toString()));
                                },
                                title: Text(
                                  "Perempuan",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: ColorTamplate.primaryColor,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.only(right: 5),
                                visualDensity:
                                    const VisualDensity(horizontal: -4),
                                activeColor: ColorTamplate.primaryColor,
                                fillColor: MaterialStateProperty.all(
                                    ColorTamplate.primaryColor),
                              ),
                            ),
                          ],
                        );
                      })
                    ],
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),

                //? Input Barang
                TextField(
                  onChanged: (value) {
                    barangPinjaman = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Barang Pinjaman",
                    contentPadding: const EdgeInsets.all(15),
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorTamplate.primaryColor)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(213, 68, 255, 0))),
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),

                //? Input Deskripsi
                TextField(
                  maxLength: 150,
                  onChanged: (value) {
                    deskripsi = value;
                  },
                  maxLines: 7, //null jika mau berubah menyesuaikan
                  decoration: InputDecoration(
                    hintText: "Deskripsi",
                    contentPadding: const EdgeInsets.all(15),
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorTamplate.primaryColor)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(213, 68, 255, 0))),
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),

                //? Input Kontak
                TextField(
                  onChanged: (value) {
                    kontak = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Kontak",
                    contentPadding: const EdgeInsets.all(15),
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorTamplate.primaryColor)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(214, 9, 232, 17))),
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),

                //? Input Harga
                TextField(
                  onChanged: (value) {
                    harga = int.parse(value);
                  },
                  decoration: InputDecoration(
                    hintText: "Harga / hari",
                    contentPadding: const EdgeInsets.all(15),
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorTamplate.primaryColor)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(214, 9, 232, 17))),
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),

                //? Input Tanggal Pinjam
                Text("Tanggal Peminjaman",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: ColorTamplate.primaryColor)),
                const SizedBox(
                  height: 5,
                ),
                BlocBuilder<BarangBloc, BarangState>(
                  builder: (context, state) {
                    if (state is TanggalPinjamState) {
                      tanggalTerpilih =
                          DateFormat.yMd().format(state.tanggalPinjam);
                    }
                    return TextField(
                      readOnly: true,
                      style: TextStyle(
                          color: ColorTamplate.primaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                      controller: TextEditingController(text: tanggalTerpilih),
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorTamplate.primaryColor)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorTamplate.primaryColor)),
                          prefixIcon: IconButton(
                              padding:
                                  const EdgeInsets.only(right: 20, left: 12),
                              iconSize: 30,
                              onPressed: () {
                                showDatePicker(
                                        builder: (context, child) {
                                          return Theme(
                                              data: ThemeData(
                                                  textButtonTheme: TextButtonThemeData(
                                                      style: ButtonStyle(
                                                          foregroundColor:
                                                              MaterialStateProperty
                                                                  .all(ColorTamplate
                                                                      .primaryColor))),
                                                  datePickerTheme: DatePickerThemeData(
                                                      headerBackgroundColor:
                                                          ColorTamplate
                                                              .primaryColor,
                                                      todayBackgroundColor:
                                                          MaterialStateProperty
                                                              .all(ColorTamplate
                                                                  .primaryColor))),
                                              child: child!);
                                        },
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2100))
                                    .then((value) {
                                  context
                                      .read<BarangBloc>()
                                      .add(TanggalPinjam(value!));
                                });
                              },
                              icon: Icon(
                                Icons.calendar_month_outlined,
                                color: ColorTamplate.primaryColor,
                              ))),
                    );
                  },
                ),
                const SizedBox(
                  height: 16,
                ),

                //? Input Tanggal Tempo
                Text("Tanggal Jatuh Tempo",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: ColorTamplate.primaryColor)),
                const SizedBox(
                  height: 5,
                ),
                BlocBuilder<BarangBloc, BarangState>(
                  builder: (context, state) {
                    if (state is TanggalTempoState) {
                      tanggalTempoTerpilih =
                          DateFormat.yMd().format(state.tanggalTempo);
                    }
                    return TextField(
                      readOnly: true,
                      style: TextStyle(
                          color: ColorTamplate.primaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                      controller:
                          TextEditingController(text: tanggalTempoTerpilih),
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorTamplate.primaryColor)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorTamplate.primaryColor)),
                          prefixIcon: IconButton(
                              padding:
                                  const EdgeInsets.only(right: 20, left: 12),
                              iconSize: 30,
                              onPressed: () {
                                showDatePicker(
                                        builder: (context, child) {
                                          return Theme(
                                              data: ThemeData(
                                                  textButtonTheme: TextButtonThemeData(
                                                      style: ButtonStyle(
                                                          foregroundColor:
                                                              MaterialStateProperty
                                                                  .all(ColorTamplate
                                                                      .primaryColor))),
                                                  datePickerTheme: DatePickerThemeData(
                                                      headerBackgroundColor:
                                                          ColorTamplate
                                                              .primaryColor,
                                                      todayBackgroundColor:
                                                          MaterialStateProperty
                                                              .all(ColorTamplate
                                                                  .primaryColor))),
                                              child: child!);
                                        },
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2100))
                                    .then((value) {
                                  context
                                      .read<BarangBloc>()
                                      .add(TanggalTempo(value!));
                                });
                              },
                              icon: Icon(
                                Icons.calendar_month_outlined,
                                color: ColorTamplate.primaryColor,
                              ))),
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }
}
