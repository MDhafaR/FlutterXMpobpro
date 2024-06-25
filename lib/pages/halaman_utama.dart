import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  final List<String> gender = ["Pria", "Wanita"];
  Functions fungsi = Functions();
  String? hasilBMI;
  double? hitungBMI;
  bool isBeratError = false;
  bool isTinggiError = false;
  bool munculHasil = false;

  String? jenisSaatini;
  double beratBadan = 0;
  double tinggiBadan = 0;

  @override
  void initState() {
    super.initState();
    jenisSaatini = gender[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Mobpro 1"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              //? Judul
              const Text(
                "BMI, atau Body Mass Index merupakan cara untuk menentukan apakah "
                "berat badanmu idealatau tidak. Cobalah sekarang!",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 16,
              ),

              //? Text Field Berat Badan
              TextField(
                textInputAction: TextInputAction.next,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  errorText:
                      (isBeratError) ? "berat badan tidak boleh kosong" : null,
                  label: const Text("Berat Badan"),
                  border: const OutlineInputBorder(),
                  suffixIcon: Align(
                    widthFactor: 1,
                    child: Text(
                      "kg",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    if (value.isEmpty) {
                      beratBadan = 0;
                      isBeratError = true;
                    } else {
                      beratBadan = int.parse(value).toDouble();
                      if (beratBadan == 0) {
                        isBeratError = true;
                      } else {
                        isBeratError = false;
                      }
                    }
                  });
                },
              ),
              const SizedBox(
                height: 16,
              ),

              //? Text Field Tinggi Badan
              TextField(
                decoration: InputDecoration(
                  errorText: (isTinggiError)
                      ? "tinggi badan tidak boleh kosong"
                      : null,
                  label: const Text("Tinggi Badan"),
                  border: const OutlineInputBorder(),
                  suffixIcon: Align(
                    widthFactor: 1,
                    child: Text(
                      "cm",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    if (value.isEmpty) {
                      tinggiBadan = 0;
                      isTinggiError = true;
                    } else {
                      tinggiBadan = int.parse(value).toDouble();
                      if (tinggiBadan == 0) {
                        isTinggiError = true;
                      } else {
                        isTinggiError = false;
                      }
                    }
                  });
                },
              ),
              const SizedBox(
                height: 16,
              ),

              //? Pilihan Jenis Kelamin
              Container(
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    RadioMenuButton(
                      value: gender[0],
                      groupValue: jenisSaatini,
                      onChanged: (value) {
                        setState(() {
                          jenisSaatini = value;
                        });
                      },
                      child: const Text(
                        "Pria",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    RadioMenuButton(
                      value: gender[1],
                      groupValue: jenisSaatini,
                      onChanged: (value) {
                        setState(() {
                          jenisSaatini = value;
                        });
                      },
                      child: const Text(
                        "Wanita",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              //? Tombol Hitung
              ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100))),
                      minimumSize:
                          MaterialStateProperty.all(const Size(100, 40))),
                  onPressed: () {
                    setState(() {
                      // Cek input berat badan
                      if (beratBadan == 0) {
                        isBeratError = true;
                      } else {
                        isBeratError =
                            false; // Set errorText menjadi null jika input sudah valid
                      }

                      // Cek input tinggi badan
                      if (tinggiBadan == 0) {
                        isTinggiError = true;
                      } else {
                        isTinggiError =
                            false; // Set errorText menjadi null jika input sudah valid
                      }

                      // Set state untuk menampilkan hasil BMI jika semua input valid
                      hitungBMI = fungsi.hitungBMI(beratBadan, tinggiBadan);
                      hasilBMI =
                          fungsi.hasilBMI(hitungBMI ?? 0, jenisSaatini ?? "");

                      // Munculkan hasil jika tidak ada error
                      munculHasil = !(isBeratError || isTinggiError);
                    });
                  },
                  child: const Text("Hitung", style: TextStyle(fontSize: 16))),
              const SizedBox(
                height: 16,
              ),

              //? Hasil
              (munculHasil)
                  ? Column(
                      children: [
                        const Divider(
                          thickness: 2,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text("BMI: ${hitungBMI?.toStringAsFixed(2)}",
                            style: const TextStyle(fontSize: 20)),
                        const SizedBox(
                          height: 24,
                        ),
                        Text("$hasilBMI",
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500))
                      ],
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}

class Functions {
  double hitungBMI(double berat, double tinggi) {
    double hitung = berat / ((tinggi / 100) * (tinggi / 100));
    return hitung;
  }

  String hasilBMI(double hitung, String jenisKelamin) {
    String hasil;
    if (jenisKelamin == "Pria") {
      if (hitung < 20.50) {
        hasil = "Kurus";
      } else if (hitung >= 20.50 && hitung <= 26.99) {
        hasil = "Ideal";
      } else if (hitung >= 27.00) {
        hasil = "Gemuk";
      } else {
        hasil = "Tidak valid";
      }
    } else {
      if (hitung < 18.50) {
        hasil = "Kurus";
      } else if (hitung >= 18.50 && hitung <= 24.99) {
        hasil = "Ideal";
      } else if (hitung >= 25.00) {
        hasil = "Gemuk";
      } else {
        hasil = "Tidak valid";
      }
    }

    return hasil;
  }
}
