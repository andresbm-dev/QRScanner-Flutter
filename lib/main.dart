import 'package:flutter/material.dart';
import 'package:qr_scanner_flutter/screens/home_screen.dart';
import 'package:qr_scanner_flutter/screens/map_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Scanner',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen() ,
        'map': (_) => const MapScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
    );
  }
}
