import 'package:flutter/material.dart';
import 'package:flutter_x_mobpro/Color/color_tamplate.dart';
import 'package:flutter_x_mobpro/pages/detail_page.dart';
import 'package:flutter_x_mobpro/widgets/item_list.dart';

class HalamanUtama extends StatelessWidget {
  HalamanUtama({super.key});

  final List<String> nama = [
    "Muhammad Dhafa Ramadhani",
    "Anisa",
    "Adrian Maulana",
    "IGN Brindawan tri guna yoga",
    "Balgis Auliya Humairah",
    "Krisnia Syahwadani",
    "Muhammad Raihan Fahrifi",
    "Muhammad Zakiy Mubarak",
  ];

  final List<String> nim = [
    "6706223068",
    "6706221728",
    "6706220047",
    "6706223067",
    "6706223008",
    "6706223000",
    "6706200009",
    "6535465563",
  ];

  final List<String> kelas = [
    "D3IF-46-04",
    "D3IF-46-03",
    "D3IF-46-04",
    "D3IF-46-05",
    "D3IF-46-01",
    "D3IF-46-04",
    "D3IF-46-04",
    "D3IF-46-02",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return DetailScreen(kelasTerpilih: kelas[4],);
            },
          ));
        },
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black
                    .withOpacity(0.2), // Warna bayangan dengan transparansi
                spreadRadius: 0, // Jangkauan bayangan
                blurRadius: 8, // Tingkat keburaman bayangan
                offset: const Offset(0, 12), // Posisi bayangan (x, y)
              ),
            ],
            borderRadius: BorderRadius.circular(17),
            color: ColorTamplate.primaryColor,
          ),
          width: 60,
          height: 60,
          child: const Icon(Icons.add),
        ),
      ),
      appBar: AppBar(
        title: Text("Mobpro 1",
            style: TextStyle(color: ColorTamplate.primaryText)),
        backgroundColor: ColorTamplate.primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
              child: CustomScrollView(
            slivers: [
              SliverList.builder(
                itemCount: nama.length,
                itemBuilder: (context, index) {
                  return ItemList(
                      nama: nama[index], nim: nim[index], kelas: kelas[index]);
                },
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 80,
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
