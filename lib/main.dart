import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_x_mobpro/bloc/product_bloc.dart';
import 'package:flutter_x_mobpro/pages/halaman_utama.dart';
import 'package:flutter_x_mobpro/services/database_instance.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    DatabaseInstance databaseInstance = DatabaseInstance();
    return BlocProvider(
      create: (context) => ProductBloc()
        ..add(InitDatabase(databaseInstance))
        ..add(GetProductEvent()),
      child: MaterialApp(
        builder: BotToastInit(),
        home: const HalamanUtama(),
      ),
    );
  }
}
