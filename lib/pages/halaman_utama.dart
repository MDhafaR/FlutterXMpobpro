import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_x_mobpro/Color/color_tamplate.dart';
import 'package:flutter_x_mobpro/widgets/item_list.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          BotToast.showText(
              text: "Belum Bisa", align: const Alignment(0, 0.98));
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
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                int date = 29 - index;
                return ItemList(date: date);
              },
            ),
          )
        ],
      ),
    );
  }
}
