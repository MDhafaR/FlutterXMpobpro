import 'package:flutter/material.dart';
import 'package:flutter_x_mobpro/Color/color_tamplate.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({this.judul, this.isi, super.key});

  final String? judul;
  final String? isi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: ColorTamplate.primaryText),
          backgroundColor: ColorTamplate.primaryColor,
          title: Text("Tambah Catatan",
              style: TextStyle(color: ColorTamplate.primaryText)),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.check,
                ))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: TextEditingController(text: judul),
                decoration: InputDecoration(
                    label: Text("Judul"), border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: TextField(
                  controller: TextEditingController(text: isi),
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                      labelText: "Isi Catatan",
                      alignLabelWithHint: true,
                      border: OutlineInputBorder()),
                ),
              ),
            ],
          ),
        ));
  }
}
