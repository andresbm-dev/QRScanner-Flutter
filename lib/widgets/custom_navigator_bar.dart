
import 'package:flutter/material.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
        currentIndex: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_compact_alt_sharp),
              label: 'Direcciones'
          ),
        ]
    );
  }
}
