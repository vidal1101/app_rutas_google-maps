import 'package:flutter/material.dart';
import 'package:app_googlemaps_rutas/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GpsAccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: BlocBuilder<GpsBloc, GpsState>(
            builder: (context, state){
              print(state);
              return !state.isGpsenabled 
              ? _EnabledGpsMessage()
              : _AccessButton();
          })
      ),
    );
  }
}

class _AccessButton extends StatelessWidget {
  const _AccessButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Es necesario el acceso al GPS',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        MaterialButton(
          color: Colors.black,
          shape: StadiumBorder(),
          elevation: 0 ,
          splashColor: Colors.transparent,
          child: Text(
            'Solicitar acceso',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () async{

            final gpsbloc = BlocProvider.of<GpsBloc>(context);
            gpsbloc.askGpsAccess();

          },
        )
      ],
    );
  }
}

class _EnabledGpsMessage extends StatelessWidget {
  const _EnabledGpsMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Debe habilitar el Gps',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    );
  }
}
