import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_flutter/providers/db_provider.dart';
import 'package:qr_scanner_flutter/providers/ui_provider.dart';
import 'package:qr_scanner_flutter/screens/directions_page.dart';
import 'package:qr_scanner_flutter/screens/history_maps.dart';
import 'package:qr_scanner_flutter/widgets/custom_floating_action_bottom.dart';
import 'package:qr_scanner_flutter/widgets/custom_navigator_bar.dart';

import '../models/scan_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: const Text('QRApp Reader'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: (){},
          )
        ],
      ),
        body: const _HomePageBody(),
      floatingActionButton: const CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomNavigatorBar(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context) ;
    final int currentIndex = uiProvider.menuSelected;
    final scan = new ScanModel(value: 'http://google.com');
    //DBProvider.db.getScanById(7).then((scan) => print(scan?.value));
    //DBProvider.db.getAllScans().then((scan) => print(scan));

    switch(currentIndex){
      case 0 : return const HistoryMapsScreen();
      case 1: return const DirectionsPage();
      default: return const HistoryMapsScreen();
    }
  }
}

