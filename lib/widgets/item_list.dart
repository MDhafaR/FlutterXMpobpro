import 'package:flutter/material.dart';
import 'package:flutter_x_mobpro/pages/detail_page.dart';

class ItemList extends StatelessWidget {
  const ItemList({required this.date, super.key});

  final int date;

  @override
  Widget build(BuildContext context) {
    String judul = "Kuliah Mobpro $date Feb";
    String isi =
        "Yey, hari ini belajar membuat aplikasi android counter dan berhasil. Hehe.. Mudah2an modul ini berguna";
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return DetailScreen(
              judul: judul,
              isi: isi,
            );
          },
        ));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(judul,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700)),
                const SizedBox(
                  height: 10,
                ),
                Text(isi, style: const TextStyle(fontSize: 18)),
                const SizedBox(
                  height: 10,
                ),
                Text("2024-02-$date 12:34:56",
                    style: const TextStyle(fontSize: 18)),
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
