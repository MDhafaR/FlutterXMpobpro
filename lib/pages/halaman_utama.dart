import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_x_mobpro/Color/color_tamplate.dart';
import 'package:flutter_x_mobpro/bloc/product_bloc.dart';
import 'package:flutter_x_mobpro/models/note_model.dart';
import 'package:flutter_x_mobpro/pages/detail_page.dart';
import 'package:flutter_x_mobpro/widgets/item_list.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return DetailScreen();
            },
          ));
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
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ProductSuccsess) {
                  List<NoteModel> data = state.note;
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ItemList(
                        data: data[index],
                      );
                    },
                  );
                } else if (state is ProductEmpty) {
                  return Center(
                    child: Text("empty"),
                  );
                }
                return Center(
                  child: Text("empty"),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
