import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BotToast.showText(
              text: "Belum Bisa", align: const Alignment(0, 0.98));
      },
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Kuliah Mobpro 29 Feb",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Yey, hari ini belajar membuat aplikasi android counter dan berhasil. Hehe.. Mudah2an modul ini berguna",
                    style: TextStyle(fontSize: 18)),
                SizedBox(
                  height: 10,
                ),
                Text("2024-02-29 12:34:56", style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          )
        ],
      ),
    );
  }
}
