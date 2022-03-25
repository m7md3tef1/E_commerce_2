import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/Blocs/FavBlocState.dart';
import 'package:untitled1/models/Product.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(InitialState());
  static FavCubit get(context) => BlocProvider.of(context);
  List<Product> favList = [];
  addProduct(Product) {
    favList.add(Product);
    emit(AddFav());
  }
  removeProduct(Product) {
    favList.reduce(Product);
    emit(DeleteFav());
  }
}
