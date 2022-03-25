import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocode/geocode.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:untitled1/domain.cubit.checkConnection/locationCubit.dart';
import 'package:untitled1/domain.cubit.checkConnection/locationState.dart';
import 'package:untitled1/presentation/dialouges/toast.dart';
class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var street;
  @override
  Widget build(BuildContext context) {
    var  latitude=LocationCubit.get(context).latitude;
  var longitude=LocationCubit.get(context).longitude;
    return BlocConsumer<LocationCubit,LocationState>( listener:(context, state){} ,
        builder: (context,state)=>FlutterMap
          (
          options: MapOptions(
            center: LatLng(LocationCubit.get(context).latitude,LocationCubit.get(context).longitude),
            zoom: 13.0,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
              attributionBuilder: (_) {
                return const Text("© OpenStreetMap contributors");
              },
            ),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng (51.5,-0.09),
                  builder: (ctx) =>
                      Container(
                        child:InkWell(
                            onTap: () async {
                              await LocationCubit.get(context).location();
                              await LocationCubit.get(context).getLocation();
                              print( LocationCubit.get(context).longitude);
                              longitude= LocationCubit.get(context).longitude;
                              print( LocationCubit.get(context).latitude);
                              latitude= LocationCubit.get(context).latitude;
                            /*  await  Location().serviceEnabled().then((value) {
                                if (!value) {
                                  Location().requestService();
                                 // emit(requestServiceLocation());
                                }
                              }).catchError((error) {
                                showToast(
                                    msg: error.toString(),
                                    state: ToastedStates.ERROR);
                              //  emit( errorLocation() );
                                print(error);
                              });
                              await   Location().hasPermission().then((value) {
                                if (value ==
                                    PermissionStatus.denied) {
                                  Location().requestPermission();
                               //   emit(requestPermissionLocation());
                                }
                              });
                             await Location().getLocation().then((value) {
                                latitude=value.latitude;
                                longitude=value.longitude;
                                print(value.latitude);
                                print(value.longitude);
                                //emit(getLocationLocation());
                                GeoCode().reverseGeocoding(latitude:latitude, longitude: longitude).then((value) {

                                  print(value.streetAddress);
                                  print(value.countryCode);
                                  print(value.countryName);
                                  print(value.city);
                                  street=value.city;
                                  print(value.streetNumber);
                                  print(value.region);
                                 // emit(getLocationsuccess());
                                }).catchError((onError){
                                 // emit(getLocationfailed());
                                  print(onError);
                                });
                              }).catchError((error){
                                showToast(
                                    msg: error.toString(),
                                    state: ToastedStates.ERROR);
                               // emit(getLocationfailed());
                                print(error);

                              });*/

                            },
                            child: const Icon(Icons.location_on)),
                      ),
                ),
              ],
            ),
          ],
        )  );
  }
}
