part of 'mahasiswa_bloc.dart';

@immutable
sealed class MahasiswaState {}

final class MahasiswaInitial extends MahasiswaState {}

final class KelasState extends MahasiswaState {
  final String kelas;

  KelasState({required this.kelas});
}