 import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocode/geocode.dart';
import 'package:location/location.dart';
import 'package:untitled1/domain.cubit.checkConnection/locationState.dart';
import 'package:untitled1/presentation/dialouges/toast.dart';

class LocationCubit extends Cubit<LocationState>{
  LocationCubit( ) : super(initialLocation());

  static LocationCubit get(context)=>BlocProvider.of(context);
  var  longitude;
  var latitude;
  String? street;
   location()async
  {
    await  Location().serviceEnabled().then((value) {
      if (!value) {
        Location().requestService();
        emit(requestServiceLocation());
      }
    }).catchError((error) {
      showToast(
          msg: error.toString(),
          state: ToastedStates.ERROR);
      emit( errorLocation() );
      print(error);
    });
    await   Location().hasPermission().then((value) {
      if (value ==
          PermissionStatus.denied) {
        Location().requestPermission();
        emit(requestPermissionLocation());
      }
    });
  }


  getLocation()async{
     emit(getLocationLoading());
    Location().getLocation().then((value) {
      latitude=value.latitude;
      longitude=value.longitude;
      print(value.latitude);
      print(value.longitude);
      emit(getLocationLocation());
      GeoCode().reverseGeocoding(latitude:latitude, longitude: longitude).then((value) {

        print(value.streetAddress);
        print(value.countryCode);
        print(value.countryName);
        print(value.city);
        street=value.city;

        emit(getLocationsuccess());
      }).catchError((onError){
        emit(getLocationfailed());
        print(onError);
      });
    }).catchError((error){
      showToast(
          msg: error.toString(),
          state: ToastedStates.ERROR);
      emit(getLocationfailed());
      print(onError);

    });
  }

}