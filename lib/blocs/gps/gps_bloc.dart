import 'package:app_googlemaps_rutas/blocs/blocs.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
  GpsBloc() : super(
    const GpsState( false ,false) )  {

    on<GpsPermissionEvent>((event, emit) =>
      // TODO: implement event handler
      emit( state.copyWith(
        isGpsenabled: event.isGpsenabled, 
        isGpsPermissionGranted: event.isGpspermisionGranted,
      ))
    );
    _init();
  }

  Future _init()async{
    //permission = await Geo locator.checkPermission();
    final isenabledstatus = await  _checkgpsStatus();
    //print('$isenabledstatus');
  }

  Future _checkgpsStatus ()async {
    final isenablegeolocator = await Geolocator.isLocationServiceEnabled();

    Geolocator.getServiceStatusStream().listen((event) {
      final isenabled = (event.index  ==1 ) ? true : false;
      print('service status: ${isenabled}');

    });
    //print(isenable);
    return isenablegeolocator;
  }
}
