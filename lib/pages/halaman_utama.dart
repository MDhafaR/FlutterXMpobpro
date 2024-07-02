import 'package:flutter/material.dart';
import 'package:flutter_x_mobpro/Color/color_tamplate.dart';
import 'package:flutter_x_mobpro/pages/input_page.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset("assets/logo.png"),
          backgroundColor: ColorTamplate.primaryColor,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InputScreen(),
                      ));
                },
                icon: Image.asset("assets/tambahObjPutih.png"))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Klik untuk melihat informasinya..."),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorTamplate.primaryColor),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/dummy.png", height: 30),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Ini Ajaa",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: ColorTamplate.primaryColor,
                                        ),
                                      ),
                                      Text(
                                        "Sunlight",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: ColorTamplate.teksMuda,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Text(
                                "40000",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: ColorTamplate.teksMuda,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        )
        // Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text(
        //         "Tambahkan\nData Baru",
        //         style: TextStyle(
        //             fontSize: 24,
        //             fontWeight: FontWeight.w600,
        //             color: ColorTamplate.primaryColor),
        //         textAlign: TextAlign.center,
        //       ),
        //       IconButton(
        //         onPressed: () {
        //           Navigator.push(context, MaterialPageRoute(builder: (context) => InputScreen(),));
        //         },
        //         icon: Image.asset("assets/tambahObject.png"),
        //         iconSize: 73,
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
