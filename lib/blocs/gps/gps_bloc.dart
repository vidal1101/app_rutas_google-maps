import 'dart:async';

import 'package:app_googlemaps_rutas/blocs/blocs.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {

  StreamSubscription? gpsstreamSubscription;

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

    add(GpsPermissionEvent(
      isGpsenabled: isenabledstatus,
      isGpspermisionGranted: state.isGpsPermissionGranted
    ));

  }

  Future _checkgpsStatus ()async {
    final isenablegeolocator = await Geolocator.isLocationServiceEnabled();

    gpsstreamSubscription = Geolocator.getServiceStatusStream().listen((event) {
      final isEnabled = (event.index  ==1 ) ? true : false;
      print('service status: ${isEnabled}');
      add(GpsPermissionEvent(
      isGpsenabled: isEnabled,
      isGpspermisionGranted: state.isGpsPermissionGranted
      ));
      

    });
    //print(isenable);
    return isenablegeolocator;
  }


  @override
  Future<void> close() {
    // TODO: implement close
    gpsstreamSubscription?.cancel();
    return super.close();

  }
}
