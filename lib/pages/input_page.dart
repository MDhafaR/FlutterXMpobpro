import 'package:flutter/material.dart';
import 'package:flutter_x_mobpro/Color/color_tamplate.dart';

class InputScreen extends StatelessWidget {
  InputScreen({super.key});

  final List<String> gender = ["Pria", "Wanita"];

  @override
  Widget build(BuildContext context) {
    String genderSaatIni = gender[0];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorTamplate.primaryColor,
          centerTitle: true,
          title: Image.asset("assets/logo.png"),
          actions: [
            InkWell(
              onTap: () {},
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IntrinsicWidth(
                              child: RadioListTile(
                            dense: true,
                            value: gender[0],
                            groupValue: genderSaatIni,
                            onChanged: (value) {
                              genderSaatIni = value.toString();
                            },
                            title: Text("Laki - laki",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: ColorTamplate.primaryColor)),
                            contentPadding: const EdgeInsets.all(0),
                            visualDensity: const VisualDensity(horizontal: -4),
                            activeColor: ColorTamplate.primaryColor,
                            fillColor: MaterialStateProperty.all(
                                ColorTamplate.primaryColor),
                          )),
                          IntrinsicWidth(
                              child: RadioListTile(
                            value: gender[1],
                            groupValue: genderSaatIni,
                            onChanged: (value) {},
                            title: Text("Perempuan",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: ColorTamplate.primaryColor)),
                            contentPadding: const EdgeInsets.only(right: 5),
                            visualDensity: const VisualDensity(horizontal: -4),
                            activeColor: ColorTamplate.primaryColor,
                            fillColor: MaterialStateProperty.all(
                                ColorTamplate.primaryColor),
                          )),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),

                //? Input Barang
                TextField(
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
                  onChanged: (value) {},
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

                //? Input Nama Asli
                TextField(
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
                TextField(
                  readOnly: true,
                  style: TextStyle(
                      color: ColorTamplate.primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                  controller: TextEditingController(text: "20 - 12 - 2024"),
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorTamplate.primaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorTamplate.primaryColor)),
                      prefixIcon: IconButton(
                          padding: EdgeInsets.only(right: 20, left: 12),
                          iconSize: 30,
                          onPressed: () {
                            showDatePicker(
                                builder: (context, child) {
                                  return Theme(
                                      data: ThemeData(
                                          textButtonTheme: TextButtonThemeData(
                                              style: ButtonStyle(
                                                  foregroundColor:
                                                      MaterialStateProperty.all(
                                                          ColorTamplate
                                                              .primaryColor))),
                                          datePickerTheme: DatePickerThemeData(
                                              headerBackgroundColor:
                                                  ColorTamplate.primaryColor,
                                              todayBackgroundColor:
                                                  MaterialStateProperty.all(
                                                      ColorTamplate
                                                          .primaryColor))),
                                      child: child!);
                                },
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100));
                          },
                          icon: Icon(
                            Icons.calendar_month_outlined,
                            color: ColorTamplate.primaryColor,
                          ))),
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
                TextField(
                  readOnly: true,
                  style: TextStyle(color: ColorTamplate.primaryColor, fontSize: 17, fontWeight: FontWeight.w600),
                  controller: TextEditingController(text: "20 - 12 - 2024"),
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorTamplate.primaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorTamplate.primaryColor)),
                      prefixIcon: IconButton(
                        padding: EdgeInsets.only(right: 20, left: 12),
                        iconSize: 30,
                          onPressed: () {
                            showDatePicker(
                                builder: (context, child) {
                                  return Theme(
                                      data: ThemeData(
                                          textButtonTheme: TextButtonThemeData(
                                              style: ButtonStyle(
                                                  foregroundColor:
                                                      MaterialStateProperty.all(
                                                          ColorTamplate
                                                              .primaryColor))),
                                          datePickerTheme: DatePickerThemeData(
                                              headerBackgroundColor:
                                                  ColorTamplate.primaryColor,
                                              todayBackgroundColor:
                                                  MaterialStateProperty.all(
                                                      ColorTamplate
                                                          .primaryColor))),
                                      child: child!);
                                },
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100));
                          },
                          icon: Icon(
                            Icons.calendar_month_outlined,
                            color: ColorTamplate.primaryColor,
                          ))),
                )
              ],
            ),
          ),
        ));
  }
}
