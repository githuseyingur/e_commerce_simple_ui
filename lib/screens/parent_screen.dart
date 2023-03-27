
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/pages/barcode.dart';
import 'package:flutter_ui/pages/favourites.dart';
import 'package:flutter_ui/pages/home.dart';
import 'package:flutter_ui/pages/search.dart';
import 'package:flutter_ui/pages/user.dart';

class ParentScreen extends StatefulWidget{
  _ParentScreenState createState() => _ParentScreenState();
}
class _ParentScreenState extends State<ParentScreen> {
  int selectedTab = 0;

  late PageController _pageController;

  List<Widget> tabPages = [
    Home(),
    Search(),
    Barcode(),
    Favourites(),
    User()
  ];
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom,]);
    _pageController = PageController(initialPage: selectedTab);
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double widthSize = resWidthSize(context); // WIDTH AND HEIGHT PARAMETERS FOR RESPONSIVE DESIGN
    double heightSize = resHeightSize(context);

    return Scaffold(
      backgroundColor: Color(0xFF111111),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: SizedBox(
        height: 64,
        child: BottomNavigationBar(
          backgroundColor: Color(0xFF1F1F1F),
          selectedItemColor: Color(0xFFD7FC70),
          unselectedItemColor: Color(0xFF737373),
          currentIndex: selectedTab,
          selectedFontSize: widthSize *heightSize *0.25,
          unselectedFontSize: widthSize *heightSize *0.25,
          onTap: onTabTapped,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/navicon1.png"),
              ),label: ""),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/navicon2.png"),
              ),label: ""),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/navicon3.png"),
              ),label: ""),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/navicon4.png"),
              ),label: ""),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/navicon5.png"),
              ),label: ""),
          ],
        ),
      ),
    );
  }
  void onPageChanged(int page) {
    // PageView onPageChanged
    setState(() {
      this.selectedTab = page;
    });
  }
  void onTabTapped(int index) {  // BottomNavigatonBar OnTap
    this._pageController.jumpToPage(index);
  }
  double resWidthSize(BuildContext context){
    double widthSize;
    if(MediaQuery.of(context).size.width>598)  widthSize = MediaQuery.of(context).size.width * 0.0072;
    else widthSize = MediaQuery.of(context).size.width * 0.01;
    return widthSize;
  }
  double resHeightSize(BuildContext context){
    double heightSize = MediaQuery.of(context).size.height * 0.01;
    return heightSize;
  }

}