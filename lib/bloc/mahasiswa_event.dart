part of 'mahasiswa_bloc.dart';

@immutable
sealed class MahasiswaEvent {}

class KelasEvent extends MahasiswaEvent {
  final String kelas;

  KelasEvent({required this.kelas});
}
