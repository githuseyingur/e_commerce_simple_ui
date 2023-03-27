
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Barcode extends StatefulWidget{
  _BarcodeState createState() => _BarcodeState();
}
class _BarcodeState extends State<Barcode> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom,]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
        ],
      ),
    );
  }

}