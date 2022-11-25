import 'package:app_googlemaps_rutas/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoogleMapsPage extends StatefulWidget {

  const GoogleMapsPage({super.key});

  @override
  State<GoogleMapsPage> createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.startFollwingUser();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('google maps'),
      ),
    );
  }
}