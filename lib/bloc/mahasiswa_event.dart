part of 'mahasiswa_bloc.dart';

@immutable
sealed class MahasiswaEvent {}

class KelasEvent extends MahasiswaEvent {
  final String kelas;

  KelasEvent({required this.kelas});
}

class InsertMahasiswa extends MahasiswaEvent {
  final String nama;
  final String nim;
  final String kelas;

  InsertMahasiswa({required this.nama, required this.nim, required this.kelas});
}

class UpdateMahasiswa extends MahasiswaEvent {
  final int id;
  final String nama;
  final String nim;
  final String kelas;

  UpdateMahasiswa(
      {required this.nama,
      required this.nim,
      required this.kelas,
      required this.id});
}

class DeleteMahasiswa extends MahasiswaEvent {
  final int id;
  DeleteMahasiswa(this.id);
}

final class DatabaseInitialization extends MahasiswaEvent {
  final DatabaseInstance database;

  DatabaseInitialization({required this.database});
}

final class GetAllDataMhs extends MahasiswaEvent {}
