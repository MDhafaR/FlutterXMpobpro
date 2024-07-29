part of 'mahasiswa_bloc.dart';

@immutable
sealed class MahasiswaState {}

final class MahasiswaInitial extends MahasiswaState {}

final class KelasState extends MahasiswaState {
  final String kelas;

  KelasState({required this.kelas});
}
final class MahasiswaDataSuccess extends MahasiswaState {
  final List<Mahasiswa> data;

  MahasiswaDataSuccess({required this.data});
}

class MahasiswaLoading extends MahasiswaState {}