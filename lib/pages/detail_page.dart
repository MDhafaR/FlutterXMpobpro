import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_x_mobpro/Color/color_tamplate.dart';
import 'package:flutter_x_mobpro/bloc/product_bloc.dart';
import 'package:flutter_x_mobpro/models/note_model.dart';

class DetailScreen extends StatefulWidget {
  final NoteModel? data;

  DetailScreen({this.data, Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late TextEditingController judul;
  late TextEditingController isi;
  bool judulTidakTerisi = false;
  bool isiTidakTerisi = false;

  @override
  void initState() {
    super.initState();
    judul = TextEditingController(text: widget.data?.judul ?? "");
    isi = TextEditingController(text: widget.data?.isi ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorTamplate.primaryText),
        backgroundColor: ColorTamplate.primaryColor,
        title: Text(widget.data != null ? "Edit Catatan" : "Tambah Catatan",
            style: TextStyle(color: ColorTamplate.primaryText)),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                judulTidakTerisi = judul.text.isEmpty;
                isiTidakTerisi = isi.text.isEmpty;
              });

              if (!judulTidakTerisi && !isiTidakTerisi) {
                if (widget.data != null) {
                  BlocProvider.of<ProductBloc>(context).add(EditProductEvent(
                      widget.data!.id, judul.text, isi.text));
                } else {
                  BlocProvider.of<ProductBloc>(context)
                      .add(AddProductEvent(judul.text, isi.text));
                }
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.check),
          ),
          if (widget.data != null)
            PopupMenuButton<String>(
              offset: Offset(0, 40),
              onSelected: (String result) {
                if (result == 'Option 1') {
                  BlocProvider.of<ProductBloc>(context)
                      .add(DeleteProductEvent(widget.data!.id));
                  Navigator.pop(context);
                }
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  padding: EdgeInsets.all(5),
                  value: 'Option 1',
                  child: Center(child: Text('Hapus Catatan')),
                ),
              ],
              icon: const Icon(Icons.more_vert),
            )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: judul,
              onChanged: (value) {
                setState(() {
                  judulTidakTerisi = value.isEmpty;
                });
              },
              decoration: InputDecoration(
                errorText:
                    judulTidakTerisi ? 'This field cannot be empty' : null,
                label: Text("Judul"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: TextField(
                controller: isi,
                onChanged: (value) {
                  setState(() {
                    isiTidakTerisi = value.isEmpty;
                  });
                },
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  errorText:
                      isiTidakTerisi ? 'This field cannot be empty' : null,
                  labelText: "Isi Catatan",
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
