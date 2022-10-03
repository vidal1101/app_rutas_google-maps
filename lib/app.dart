import 'package:app_googlemaps_rutas/UI/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:  false,
      initialRoute:  'home',
      routes: {
        'home' :(context) => HomePage(), 
      },
    );
  }
}
