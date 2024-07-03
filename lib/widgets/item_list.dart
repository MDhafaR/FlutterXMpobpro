import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  ItemList({required this.date, super.key});

  int date;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BotToast.showText(text: "Belum Bisa", align: const Alignment(0, 0.98));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Kuliah Mobpro $date Feb",
                    style:
                        const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                    "Yey, hari ini belajar membuat aplikasi android counter dan berhasil. Hehe.. Mudah2an modul ini berguna",
                    style: TextStyle(fontSize: 18)),
                const SizedBox(
                  height: 10,
                ),
                Text("2024-02-$date 12:34:56", style: const TextStyle(fontSize: 18)),
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
