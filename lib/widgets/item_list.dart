import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

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
        BotToast.showText(text: nama, align: const Alignment(0, 0.98));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nama,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                SizedBox(
                  height: 10,
                ),
                Text(
                    nim,
                    style: TextStyle(fontSize: 18)),
                SizedBox(
                  height: 10,
                ),
                Text(kelas, style: TextStyle(fontSize: 18)),
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
