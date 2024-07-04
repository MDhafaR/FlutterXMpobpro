import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_x_mobpro/Color/color_tamplate.dart';
import 'package:flutter_x_mobpro/bloc/mahasiswa_bloc.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  DetailScreen({this.kelasTerpilih, this.nama, this.nim, super.key});

  final List<String> kelas = [
    "D3IF-46-01",
    "D3IF-46-02",
    "D3IF-46-03",
    "D3IF-46-04",
    "D3IF-46-05",
  ];

  String? kelasTerpilih;
  String? nama;
  String? nim;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                context.read<MahasiswaBloc>().add(KelasEvent(kelas: kelasTerpilih ?? ""));
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          backgroundColor: ColorTamplate.primaryColor,
          iconTheme: IconThemeData(color: ColorTamplate.primaryText),
          actions: [
            IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: const Icon(Icons.check))
          ],
          title: Text("Tambah Mahasiswa",
              style: TextStyle(color: ColorTamplate.primaryText)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: TextEditingController(text: nama),
                decoration: const InputDecoration(
                    labelText: "Nama", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: TextEditingController(text: nim),
                decoration: const InputDecoration(
                    labelText: "Nim", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return BlocBuilder<MahasiswaBloc, MahasiswaState>(
                      builder: (context, state) {
                        return RadioListTile(
                          contentPadding: const EdgeInsets.all(0),
                          visualDensity: const VisualDensity(horizontal: -4),
                          value: kelas[index],
                          groupValue: (state is KelasState)
                              ? state.kelas
                              : kelasTerpilih,
                          onChanged: (value) {
                            context
                                .read<MahasiswaBloc>()
                                .add(KelasEvent(kelas: value.toString()));
                          },
                          title: Text("D3IF-46-0${index + 1}"),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
