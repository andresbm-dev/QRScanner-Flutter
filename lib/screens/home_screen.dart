import 'package:flutter/material.dart';
import 'package:qr_scanner_flutter/widgets/custom_floating_action_bottom.dart';
import 'package:qr_scanner_flutter/widgets/custom_navigator_bar.dart';

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
        body:const  Center(
            child: Text('home')
        ),
      floatingActionButton: const CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomNavigatorBar(),
    );
  }
}
