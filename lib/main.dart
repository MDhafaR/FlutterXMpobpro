import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_x_mobpro/bloc/mahasiswa_bloc.dart';
import 'package:flutter_x_mobpro/pages/halaman_utama.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MahasiswaBloc(),
      child: MaterialApp(
        builder: BotToastInit(),
        home: HalamanUtama(),
      ),
    );
  }
}
