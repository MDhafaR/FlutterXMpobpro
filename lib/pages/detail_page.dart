import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_x_mobpro/Color/color_tamplate.dart';
import 'package:flutter_x_mobpro/bloc/mahasiswa_bloc.dart';
import 'package:flutter_x_mobpro/models/mahasiswa.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  DetailScreen({this.data, super.key});

  Mahasiswa? data;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  TextEditingController? namaControl;
  TextEditingController? nimControl;
  String? kelasControl;

  final List<String> kelas = [
    "D3IF-46-01",
    "D3IF-46-02",
    "D3IF-46-03",
    "D3IF-46-04",
    "D3IF-46-05",
  ];

  @override
  void initState() {
    super.initState();
    namaControl = TextEditingController();
    nimControl = TextEditingController();
    kelasControl = "D3IF-46-01";
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data != null) {
      setState(() {
        namaControl!.text = widget.data!.nama;
        nimControl!.text = widget.data!.nim;
        kelasControl = widget.data!.kelas;
      });
    }
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                // context
                //     .read<MahasiswaBloc>()
                //     .add(KelasEvent(kelas: widget.kelasTerpilih ?? ""));
                BlocProvider.of<MahasiswaBloc>(context).add(GetAllDataMhs());
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          backgroundColor: ColorTamplate.primaryColor,
          iconTheme: IconThemeData(color: ColorTamplate.primaryText),
          actions: [
            widget.data != null
                ? PopupMenuButton(
                    offset: Offset(30, 40),
                    onSelected: (value) {
                      if (value == "1") {
                        BlocProvider.of<MahasiswaBloc>(context)
                            .add(DeleteMahasiswa(widget.data!.id));
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: ColorTamplate.primaryColor,
                            duration: Duration(seconds: 1),
                            content: Text(
                                "Data atas nama ${widget.data!.nama} berhasil dihapus",
                                style: TextStyle(color: ColorTamplate.primaryText))));
                      }
                    },
                    icon: const Icon(Icons.more_vert),
                    itemBuilder: (context) {
                      return <PopupMenuEntry<String>>[
                        PopupMenuItem(
                            padding: EdgeInsets.zero,
                            value: '1',
                            child: Center(child: Text("Hapus Catatan")))
                      ];
                    },
                  )
                : Container(),
            IconButton(
                onPressed: () {
                  if (widget.data != null) {
                    BlocProvider.of<MahasiswaBloc>(context).add(UpdateMahasiswa(
                        nama: namaControl!.text,
                        nim: nimControl!.text,
                        kelas: kelasControl!,
                        id: widget.data!.id));
                    Navigator.pop(context);
                  } else {
                    BlocProvider.of<MahasiswaBloc>(context).add(InsertMahasiswa(
                        nama: namaControl!.text,
                        nim: nimControl!.text,
                        kelas: kelasControl!));
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.check))
          ],
          title: Text(
              widget.data == null ? "Tambah Mahasiswa" : "Edit Mahasiswa",
              style: TextStyle(color: ColorTamplate.primaryText)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: namaControl,
                  decoration: const InputDecoration(
                      labelText: "Nama", border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: nimControl,
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
                      return RadioListTile(
                        contentPadding: const EdgeInsets.all(0),
                        visualDensity: const VisualDensity(horizontal: -4),
                        value: kelas[index],
                        groupValue: kelasControl,
                        onChanged: (value) {
                          setState(() {
                            kelasControl = value.toString();
                          });
                          // context
                          //     .read<MahasiswaBloc>()
                          //     .add(KelasEvent(kelas: value.toString()));
                        },
                        title: Text("D3IF-46-0${index + 1}"),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
