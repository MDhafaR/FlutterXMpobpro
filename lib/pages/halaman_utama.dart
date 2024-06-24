import 'package:flutter/material.dart';
import 'package:flutter_x_mobpro/color/color_tamplate.dart';
import 'package:flutter_x_mobpro/models/lampu.dart';

class HalamanUtama extends StatefulWidget {
  const HalamanUtama(this.lampu, {super.key});

  final List<Lampu> lampu;

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobpro 1"),
        backgroundColor: ColorTamplate().primarySmall,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "${widget.lampu[index].image}",
              height: 150,
              width: 150,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "${widget.lampu[index].kondisi}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  index++;
                  if (index == widget.lampu.length) {
                    index = 0;
                  }
                });
              },
              child: Text("${widget.lampu[index].tombolText}"),
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(150, 40)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17))),
                  backgroundColor: MaterialStateProperty.all(
                      ColorTamplate().primaryBig)),
            )
          ],
        ),
      ),
    );
  }
}
