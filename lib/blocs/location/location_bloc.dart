import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {

  LocationBloc() : super(LocationState()) {

    on<LocationEvent>((event, emit) {
      // TODO: implement event handler
    });

  }


  Future getcurrentposition()async{
    final position = await Geolocator.getCurrentPosition();
    //print('position: $position');
  }


  void startFollwingUser(){

    Geolocator.getPositionStream().listen((event) {
      final position = event;
      print(position);
    });

  }

}
