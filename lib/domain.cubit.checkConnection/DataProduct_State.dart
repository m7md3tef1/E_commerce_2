abstract class DataProductState{}
class InitialStateData extends DataProductState{}


class GetDataLoading extends DataProductState{}
class GetDataSuccess extends DataProductState{}

class GetDataFailed extends DataProductState{
  final String error;

  GetDataFailed(this.error);
}
class deleteLoading extends DataProductState{}
class deleteSuccess extends DataProductState{}

class deleteFailed extends DataProductState{
   final String error;

   deleteFailed(this.error);
}
class GetOrderLoading extends DataProductState{}
class GetOrderSuccess extends DataProductState{}

class GetOrderFailed extends DataProductState{
  final String error;

  GetOrderFailed(this.error);
}
