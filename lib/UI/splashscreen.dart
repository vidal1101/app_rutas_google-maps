import 'package:app_googlemaps_rutas/UI/ui.dart';
import 'package:app_googlemaps_rutas/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state) {
          return state.isAllPermission ?
          GoogleMapsPage() : GpsAccessScreen();
        },
      )
    );
  }
}
