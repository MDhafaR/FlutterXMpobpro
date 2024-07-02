part of 'barang_bloc.dart';

@immutable
sealed class BarangEvent {}

class OnSubmit extends BarangEvent {
  final List<Barang> totalBarang;

  OnSubmit(this.totalBarang);
}

class ChangeGender extends BarangEvent {
  final String jenisKelamin;

  ChangeGender(this.jenisKelamin);
}

class TanggalPinjam extends BarangEvent {
  final DateTime tanggalPinjam;

  TanggalPinjam(this.tanggalPinjam);
}

class TanggalTempo extends BarangEvent {
  final DateTime tanggalTempo;

  TanggalTempo(this.tanggalTempo);
}
