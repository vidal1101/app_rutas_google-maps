import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {

  StreamSubscription? positionStream;

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
    print('start following user');
    positionStream =  Geolocator.getPositionStream().listen((event) {
      final position = event;
      print(position);
    });

  }

  void stopFollowingUser (){
    positionStream?.cancel();
    print('stop following user!!');
  }

  @override
  Future<void> close() {
    // TODO: implement close
    positionStream?.cancel();
    return super.close();
  }

}
