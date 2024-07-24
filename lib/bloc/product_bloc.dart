import 'package:bloc/bloc.dart';
import 'package:flutter_x_mobpro/models/note_model.dart';
import 'package:flutter_x_mobpro/services/database_instance.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    DatabaseInstance databaseInstance = DatabaseInstance();
    on<InitDatabase>((event, emit) {
      databaseInstance = event.database;
    });

    on<GetProductEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final result = await databaseInstance.getAll();
        if (result.isNotEmpty) {
          emit(ProductSuccsess(result));
        } else {
          emit(ProductEmpty());
        }
      } catch (e) {
        print("ini po error : $e");
      }
    });

    on<AddProductEvent>((event, emit) async {
      try {
        databaseInstance.insert({
          "judul": event.judul,
          "isi": event.isi,
          "updated_at": DateTime.now().toString()
        });
        add(GetProductEvent());
      } catch (e) {
        print("ini po error insert : $e");
      }
    });

    on<EditProductEvent>((event, emit) {
      databaseInstance.update(event.id, {
        "judul": event.judul,
        "isi": event.isi,
        "updated_at": DateTime.now().toString(),
      });
      add(GetProductEvent());
    });

    on<DeleteProductEvent>((event, emit) {
      databaseInstance.delete(event.id);
      add(GetProductEvent());
    });
  }
}
