import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class UnavailableScreen extends StatefulWidget{
  _UnavailableScreenState createState() => _UnavailableScreenState();
}
class _UnavailableScreenState extends State<UnavailableScreen> {
  final riveFileName = 'monster-game.riv';
  late Artboard _artboard;
  late RiveAnimationController _controller;

  void _loadRiveFile() async {
    final bytes = await rootBundle.load('animation/$riveFileName');    // Load the animation file
    final file = RiveFile.import(bytes);

    _artboard = file.mainArtboard;
    _controller = SimpleAnimation('Thumbnail');
    setState(() {
      _artboard.addController(_controller);
    });

  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom,]);
    _loadRiveFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF111111),
      body: Center(
        child: Column(
          children: [
            Expanded(child: SizedBox(),flex: 5,),
            Expanded(child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      _controller.isActiveChanged.addListener(() {
                        // IF 'IsPosition1Pressed' --> State = Position1 -    // Note : There are few resources about LISTENERS
                      });
                      _controller = SimpleAnimation('Jump');
                      _artboard.addController(_controller);
                    });
                  },
                  child: _artboard == null
                      ?  SizedBox()
                      : Rive(                                  //RIVE
                    artboard: _artboard,
                    fit: BoxFit.fill,
                  ),
                )
            ),flex: 9,),
            Expanded(child: Container(
              padding: EdgeInsets.only(top: 10, left: 36, right: 36),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("This product is unavailable.", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                  ),
                  ),
                  SizedBox(height: 6,),
                  Text("Unfortunately, this product might be out of stock or unavailable to order.", style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.white
                  ), textAlign: TextAlign.center,),
                ],
              ),
            ),flex: 4,),
            Expanded(child: SizedBox(),flex: 3,),
            Expanded(child: GestureDetector(
              onTap: (){
                SnackBar snackBar = SnackBar(content: Text("Tapped! (See What's New) "),);
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Container(
                width: 120,
                height: 120,
                child:
                    CustomPaint(painter: CustomShape(), child: Center(child: Text("See What's New", textAlign: TextAlign.center, style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black
                    ),)),),

              ),
            ),flex: 4,),
            Expanded(child: SizedBox(),flex: 5,),
          ],
        ),
      ),
    );
  }
}
class CustomShape extends CustomPainter{
  void paint(Canvas canvas, Size size){
    final paint = Paint();
    paint.color= Colors.white;
    paint.style = PaintingStyle.fill; // WHITE RECTANGLE
    paint.strokeWidth = 1;

    final paint2 = Paint();
    paint2.color= Colors.black;
    paint2.style = PaintingStyle.stroke; // BORDER
    paint2.strokeWidth = 2.4;

    final paint3 = Paint();
    paint3.color = Color(0xFFD7FC70);
    paint3.style = PaintingStyle.fill;   // BACKGROUND RECTANGLE
    paint3.strokeWidth = 1;
    RRect fullRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(size.width/2,size.height/2), width: size.width*1.5, height: size.height*0.72, ),
      Radius.circular(15),
    );
    RRect fullRect2 = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(size.width*1.1/2,size.height*1.1/2), width: size.width*1.5, height: size.height*0.72, ),
      Radius.circular(15),
    );
    canvas.drawRRect(fullRect2, paint3);
    canvas.drawRRect(fullRect, paint);
    canvas.drawRRect(fullRect, paint2);
  }


  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
   return true;
  }}