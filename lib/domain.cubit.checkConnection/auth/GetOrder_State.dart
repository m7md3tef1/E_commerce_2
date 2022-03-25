abstract class DataOrderState {}

class InitialStateOrder extends DataOrderState {}

class GetOrderLoading extends DataOrderState {}

class GetOrderSuccess extends DataOrderState {}

class GetOrderFailed extends DataOrderState {
  final String error;

  GetOrderFailed(this.error);
}

class deleteSuccess extends DataOrderState {

}
class deleteFailed extends DataOrderState
{
  final String error;

  deleteFailed(this.error);
}
