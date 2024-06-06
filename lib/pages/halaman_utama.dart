import 'package:flutter/material.dart';
import 'package:flutter_x_mobpro/model/hewan.dart';

class HalamanUtama extends StatefulWidget {
  HalamanUtama(this.hewan, {super.key});

  List<Hewan> hewan;

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
        backgroundColor: Color.fromARGB(255, 156, 120, 229),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "${widget.hewan[index].image}",
              height: 150,
              width: 150,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "${widget.hewan[index].nama}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  index++;
                  if (index == 5) {
                    index = 0;
                  }
                });
              },
              child: Text("Lanjut"),
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(200, 40)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17))),
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 143, 104, 221))),
            )
          ],
        ),
      ),
    );
  }
}
