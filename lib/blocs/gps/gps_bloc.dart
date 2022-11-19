import 'dart:async';

import 'package:app_googlemaps_rutas/blocs/blocs.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

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

  Future askGpsAccess ()async {
    final status = await  Permission.location.request();

    switch (status){
      
      case PermissionStatus.granted:
        // TODO: Handle this case.
        add(GpsPermissionEvent(
          isGpsenabled: state.isGpsenabled,
          isGpspermisionGranted: true, 
        ));
        break;

      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
        add(GpsPermissionEvent(
          isGpsenabled: state.isGpsenabled,
          isGpspermisionGranted: false, 
        ));
        openAppSettings();
    }

  }


  @override
  Future<void> close() {
    // TODO: implement close
    gpsstreamSubscription?.cancel();
    return super.close();

  }
}
