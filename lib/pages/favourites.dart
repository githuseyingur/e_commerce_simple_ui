
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Favourites extends StatefulWidget{
  _FavouritesState createState() => _FavouritesState();
}
class _FavouritesState extends State<Favourites> {
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