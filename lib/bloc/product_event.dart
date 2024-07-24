part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class InitDatabase extends ProductEvent {
  DatabaseInstance database;
  InitDatabase(this.database);
}

class GetProductEvent extends ProductEvent {}

class AddProductEvent extends ProductEvent {
  String judul;
  String isi;

  AddProductEvent(this.judul, this.isi);
}

class EditProductEvent extends ProductEvent {
  int id;
  String judul;
  String isi;

  EditProductEvent(this.id, this.judul, this.isi);
}

class DeleteProductEvent extends ProductEvent {
  int id;

  DeleteProductEvent(this.id);
}