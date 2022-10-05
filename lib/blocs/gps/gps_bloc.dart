import 'package:app_googlemaps_rutas/blocs/blocs.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
  }
}
