part of 'barang_bloc.dart';

@immutable
sealed class BarangState {}

final class BarangInitial extends BarangState {}

final class BarangSuccess extends BarangState {
  final List<Barang> totalBarang;
  
  BarangSuccess(this.totalBarang);
}

final class GenderState extends BarangState {
  final String jenisKelamin;

  GenderState(this.jenisKelamin);
}

final class TanggalPinjamState extends BarangState {
  final DateTime tanggalPinjam;

  TanggalPinjamState(this.tanggalPinjam);
}

final class TanggalTempoState extends BarangState {
  final DateTime tanggalTempo;

  TanggalTempoState(this.tanggalTempo);
}