import 'package:flutter/material.dart';
import 'package:app_googlemaps_rutas/UI/ui.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:  false,
      initialRoute:  'home',
      routes: {
        'home' :(context) => HomePage(), 
        'splah' :(context) => LoadingPage(),
      },
    );
  }
}
