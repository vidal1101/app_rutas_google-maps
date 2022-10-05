part of 'gps_bloc.dart';

class GpsState extends Equatable {

  final bool isGpsenabled;
  final bool isGpsPermissionGranted ;

  const GpsState(
    this.isGpsenabled,
    this.isGpsPermissionGranted);
  
  @override
  List<Object> get props => [
    isGpsenabled , isGpsPermissionGranted
  ];
}
