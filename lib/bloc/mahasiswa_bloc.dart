import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_x_mobpro/models/mahasiswa.dart';
import 'package:flutter_x_mobpro/services/database_instance.dart';
import 'package:meta/meta.dart';
part 'mahasiswa_event.dart';
part 'mahasiswa_state.dart';

class MahasiswaBloc extends Bloc<MahasiswaEvent, MahasiswaState> {
  MahasiswaBloc() : super(MahasiswaInitial()) {
    DatabaseInstance database = DatabaseInstance();
    on<KelasEvent>((event, emit) {
      emit(KelasState(kelas: event.kelas));
    });
    on<DatabaseInitialization>((event, emit) {
      database = event.database;
    });
    on<GetAllDataMhs>((event, emit) async {
      emit(MahasiswaLoading());
      final data = await database.getAll();
      emit(MahasiswaDataSuccess(data: data));
    });
    on<InsertMahasiswa>((event, emit) async {
      await database.insert({
        "nama": event.nama,
        "nim": event.nim,
        "kelas": event.kelas,
      });
      add(GetAllDataMhs());
    });
    on<UpdateMahasiswa>((event, emit) async {
      await database.update({
        "nama": event.nama,
        "nim": event.nim,
        "kelas": event.kelas,
      }, event.id);
      add(GetAllDataMhs());
    });
    on<DeleteMahasiswa>((event, emit) async {
      await database.delete(event.id);
      add(GetAllDataMhs());
    });
  }
}
