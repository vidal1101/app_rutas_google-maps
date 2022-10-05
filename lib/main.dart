import 'package:flutter/material.dart';
import 'package:app_googlemaps_rutas/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_googlemaps_rutas/blocs/blocs.dart';

void main() {
  runApp( MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => GpsBloc(),
      ),
    ],
    child:  MyApp(),
  )
  );
}
