import 'package:flutter/material.dart';
import 'package:flutter_x_mobpro/models/mahasiswa.dart';
import 'package:flutter_x_mobpro/pages/detail_page.dart';

class ItemList extends StatelessWidget {
  ItemList({required this.dataMhs, super.key});

  final Mahasiswa dataMhs;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return DetailScreen(
              data: dataMhs,
            );
          },
        ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dataMhs.nama,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700)),
                const SizedBox(
                  height: 10,
                ),
                Text(dataMhs.nim, style: const TextStyle(fontSize: 18)),
                const SizedBox(
                  height: 10,
                ),
                Text(dataMhs.kelas, style: const TextStyle(fontSize: 18)),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          )
        ],
      ),
    );
  }
}
