

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
        onPressed: ()async{
          /*String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#3D8BEF',
              'CANCELAR',
              false,
              ScanMode.QR);*/
          final barcodeScanRes = 'https://github.com/andresbm-dev';
          print(barcodeScanRes);
        },
        child: const Icon(Icons.qr_code),
    );
  }
}
