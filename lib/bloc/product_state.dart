part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

final class ProductSuccsess extends ProductState {
  List<NoteModel> note = [];
  ProductSuccsess(this.note);
}

final class ProductEmpty extends ProductState {}