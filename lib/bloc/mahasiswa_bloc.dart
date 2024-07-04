import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mahasiswa_event.dart';
part 'mahasiswa_state.dart';

class MahasiswaBloc extends Bloc<MahasiswaEvent, MahasiswaState> {
  MahasiswaBloc() : super(MahasiswaInitial()) {
    on<KelasEvent>((event, emit) {
      emit(KelasState(kelas: event.kelas));
    });
  }
}
