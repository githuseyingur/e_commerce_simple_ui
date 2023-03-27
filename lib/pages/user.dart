
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class User extends StatefulWidget{
  _UserState createState() => _UserState();
}
class _UserState extends State<User> {
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