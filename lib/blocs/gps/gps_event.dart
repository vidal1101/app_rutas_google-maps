part of 'gps_bloc.dart';

abstract class GpsEvent extends Equatable {
  const GpsEvent();

  @override
  List<Object> get props => [];
}


class GpsPermissionEvent extends GpsEvent {

  final bool isGpsenabled;
  final bool isGpspermisionGranted;

 const GpsPermissionEvent({
  required this.isGpsenabled, 
  required this.isGpspermisionGranted,
 });

}