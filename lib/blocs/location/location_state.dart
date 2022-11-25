part of 'location_bloc.dart';

class LocationState extends Equatable {

  final bool followingUser ;

  LocationState({
     this.followingUser =false
  });

  
  @override
  List<Object> get props => [
    followingUser
  ];
}

