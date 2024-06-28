import 'package:flutter/material.dart';
import 'package:flutter_x_mobpro/Color/color_tamplate.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorTamplate.primaryColor,
          centerTitle: true,
          title: Image.asset("assets/logo.png"),
          actions: [
            InkWell(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/savePutih.png"),
                  const Text("Save")
                ],
              ),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Nama Asli",
                  contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorTamplate.primaryColor)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(214, 9, 232, 17))
                    ),
                    ),
              )
            ],
          ),
        ));
  }
}
