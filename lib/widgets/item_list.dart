import 'package:flutter/material.dart';
import 'package:flutter_x_mobpro/pages/detail_page.dart';

class ItemList extends StatelessWidget {
  const ItemList(
      {required this.nama, required this.nim, required this.kelas, super.key});

  final String nama;
  final String nim;
  final String kelas;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return DetailScreen(
              nama: nama,
              nim: nim,
              kelasTerpilih: kelas,
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
                Text(nama,
                    style:
                        const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                const SizedBox(
                  height: 10,
                ),
                Text(nim, style: const TextStyle(fontSize: 18)),
                const SizedBox(
                  height: 10,
                ),
                Text(kelas, style: const TextStyle(fontSize: 18)),
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
