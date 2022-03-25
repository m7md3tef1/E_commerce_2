import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/data/api/ApiOrder.dart';
import 'package:untitled1/domain.cubit.checkConnection/auth/GetOrder_State.dart';
import 'package:untitled1/models/Order.dart';
import 'package:untitled1/models/Product.dart';
import 'package:untitled1/presentation/dialouges/toast.dart';

class GetOrderCubit extends Cubit<DataOrderState> {
  GetOrderCubit() : super(InitialStateOrder());
  static GetOrderCubit get(context) => BlocProvider.of(context);
  List<Order> OrderList = [];
  GetAllOrders() {
    emit(GetOrderLoading());
    OrderApi api = OrderApi(OrderList);
    api.getOrders().then((value) {
      OrderList = value;
      emit(GetOrderSuccess());
      showToast(msg: 'Success', state: ToastedStates.SUCCESS);
    }).catchError((onError) {
      showToast(msg: onError.toString(), state: ToastedStates.ERROR);
      emit(GetOrderFailed(onError));
    });
  }
}
