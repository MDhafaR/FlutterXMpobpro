import 'package:flutter/material.dart';
import 'package:flutter_x_mobpro/Color/color_tamplate.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorTamplate.primaryColor,
          title: Text("Tambah Catatan",
              style: TextStyle(color: ColorTamplate.primaryText)),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.check,
                  color: ColorTamplate.primaryText,
                ))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    label: Text("Judul"), border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: TextField(
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                      label: Text("Isi Catatan"),
                      border: OutlineInputBorder()),
                ),
              ),
            ],
          ),
        ));
  }
}
