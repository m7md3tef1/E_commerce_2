import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/data/Api.dart';
import 'package:untitled1/data/Api.dart';
import 'package:untitled1/domain.cubit.checkConnection/DataProduct_State.dart';
import 'package:untitled1/models/Product.dart';
import 'package:untitled1/presentation/dialouges/toast.dart';
import '../data/Api.dart';
import '../models/Order.dart';

class DataProductCubit extends Cubit<DataProductState> {
  DataProductCubit() : super(InitialStateData());
  static DataProductCubit get(context) => BlocProvider.of(context);
  List<Product> ProductList = [];
  GetAllProduct() {
    emit(GetDataLoading());
    ProductApi api = ProductApi(ProductList);
    api.getProducts().then((value) {
      ProductList = value;
      emit(GetDataSuccess());
    }).catchError((onError) {
      showToast(msg: onError.toString(), state: ToastedStates.ERROR);
      emit(GetDataFailed(onError));
    });
  }

  Product? Delete;
  DeleteProduct() {
    emit(deleteLoading());
    DeleteProductApi api = DeleteProductApi();
    api.deleteProduct().then((value) {
      Delete?.id = value;
      GetAllProduct();
      emit(deleteSuccess());
    }).catchError((onError) {
      showToast(msg: onError.toString(), state: ToastedStates.ERROR);
      emit(deleteFailed(onError));
    });
  }

  Order? order;
  void createOrder({
    required String name,
    required String price,
    required String imgurl,
  }) { emit(GetOrderLoading());
    Order order = Order(name: name, price: price, imgurl: imgurl);

    FirebaseFirestore.instance
        .collection('Order')
        .doc(order.id)
        .set(order.toMap())
        .then((value) {
      emit(GetOrderSuccess());
    }).catchError((onError) {
      emit(GetOrderFailed(onError));
    });
  }
}
