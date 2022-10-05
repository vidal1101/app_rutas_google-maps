import 'package:flutter/material.dart';

class GpsAccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:_EnabledGpsMessage(),
                // _AccessButton()
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
          onPressed: () {

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
