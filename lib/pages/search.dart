
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Search extends StatefulWidget{
  _SearchState createState() => _SearchState();
}
class _SearchState extends State<Search> {
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