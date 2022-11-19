part of 'gps_bloc.dart';

class GpsState extends Equatable {

  final bool isGpsenabled;
  final bool isGpsPermissionGranted ;

  bool get isAllPermission => isGpsenabled && isGpsPermissionGranted ;

  const GpsState(
    this.isGpsenabled,
    this.isGpsPermissionGranted
  );

  GpsState copyWith({
    bool? isGpsenabled,
    bool? isGpsPermissionGranted,
  }) => GpsState(
    isGpsenabled  ?? this.isGpsenabled , 
    isGpsPermissionGranted ?? this.isGpsPermissionGranted,
    );
  


  @override
  List<Object> get props => [
    isGpsenabled , isGpsPermissionGranted
  ];

  @override
  String toString() {
    // TODO: implement toString
    return '{ isGpsenabled: ${isGpsenabled}  ,  isGpsPermissionGranted: ${isGpsPermissionGranted} }';
  }
}

