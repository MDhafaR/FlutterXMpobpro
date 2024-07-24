import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_x_mobpro/bloc/product_bloc.dart';
import 'package:flutter_x_mobpro/models/note_model.dart';
import 'package:flutter_x_mobpro/pages/detail_page.dart';

class ItemList extends StatelessWidget {
  ItemList({required this.data, super.key});
  NoteModel data;

  @override
  Widget build(BuildContext context) {

       return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return DetailScreen(
                  data: data,
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
                    Text(data.judul,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(data.isi, style: const TextStyle(fontSize: 18)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(data.updatedAt,
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
