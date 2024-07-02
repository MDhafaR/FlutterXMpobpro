import 'package:bloc/bloc.dart';
import 'package:flutter_x_mobpro/models/barang.dart';
import 'package:meta/meta.dart';

part 'barang_event.dart';
part 'barang_state.dart';

class BarangBloc extends Bloc<BarangEvent, BarangState> {
  BarangBloc() : super(BarangInitial()) {
    on<BarangEvent>((event, emit) {
      if (event is OnSubmit) {
        emit(BarangSuccess(event.totalBarang));
      }
      if (event is ChangeGender) {
        emit(GenderState(event.jenisKelamin));
      }
      if (event is TanggalPinjam) {
        emit(TanggalPinjamState(event.tanggalPinjam));
      }
      if (event is TanggalTempo) {
        emit(TanggalTempoState(event.tanggalTempo));
      }
    });
  }
}
