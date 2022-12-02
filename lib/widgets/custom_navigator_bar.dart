
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_flutter/providers/ui_provider.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context) ;

    final currentIndex = uiProvider.menuSelected;
    return BottomNavigationBar(
      elevation: 0,
        onTap:(int i ){
        uiProvider.setMenu= i;
        } ,
        currentIndex: currentIndex,
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
