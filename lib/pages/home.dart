import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/components/categories.dart';
import 'package:flutter_ui/components/gridItem.dart';
import 'package:flutter_ui/model/product.dart';
import 'package:flutter_ui/screens/unavailable_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget{
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {

  Color selectedColor = Color(0xFFD7FC70); // CATEGORY COLORS
  Color unselectedColor = Color(0xFF2B2B2B);
  int activeIndex = 0; // SLIDER INDEX

  final sliderImages = [  // SLIDER IMAGE LIST
    Image(image: AssetImage("assets/slider_image.png"),fit: BoxFit.fill,),
    Image(image: AssetImage("assets/slider_image.png"),fit: BoxFit.fill,),
    Image(image: AssetImage("assets/slider_image.png"),fit: BoxFit.fill,),
    Image(image: AssetImage("assets/slider_image.png"),fit: BoxFit.fill,)
  ];
  @override
  void initState() {

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom,]); // REMOVE ANDROID STATUS BAR
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double widthSize = resWidthSize(context);
    double heightSize = resHeightSize(context);
    return Scaffold(
      backgroundColor: Color(0xFF111111),
      body: Column(
        children: [
          Expanded(child: Container(  // APP BAR
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon: ImageIcon(AssetImage("assets/filter_icon.png"), color: Colors.white, size: 20,)),
                Spacer(),
                IconButton(onPressed: (){}, icon: ImageIcon(AssetImage("assets/search_icon.png"), color: Colors.white, size: 20,)),
                IconButton(onPressed: (){}, icon: ImageIcon(AssetImage("assets/bag_icon.png"), color: Colors.white, size: 20,)),
              ],
            ),
          ),flex:6),
          Container(                                              //SLIDER CONTAINER
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: heightSize*1.6),
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: widthSize*81,
                    height: widthSize*30,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFD7FC70),width: 2),
                      borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                ),
                Container(
                  width: widthSize*81,
                  height: widthSize*30,
                  color: Colors.transparent,
                  margin: EdgeInsets.only(right: widthSize*2,top: widthSize*2),
                  alignment: Alignment.bottomCenter,
                  child: CarouselSlider.builder(
                    itemCount: sliderImages.length,
                    itemBuilder: (context,index,realIndex){
                      final sliderImage= sliderImages[index];
                      return buildImage(sliderImage,index);
                    },
                    options: CarouselOptions(

                      onPageChanged: (index,reason) =>
                          setState(()=> activeIndex = index),
                      autoPlay: true,
                      padEnds: false,
                      viewportFraction: 1.6,
                      aspectRatio: 2.7                        // slider_image ASPECT RATIO (370x138) : 2.7

                    ),
                  ),
                ),

              ],
            ),
          ),
          Expanded(child: Padding(
            padding: EdgeInsets.only(left: widthSize*4.8,top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [sliderIndicator()],
            ),
          ),flex: 3,),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Categories(),             // CATEGORIES
          ),flex:3),

          Expanded(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: GridView.builder(                                             // Products GRIDVIEW
              itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  childAspectRatio: 0.62,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16
                ),
                itemBuilder: (context, index) => GridItem(products[index], () => Navigator.push(context, MaterialPageRoute(builder: (context) => UnavailableScreen())))
            ),
          ), flex:30),

        ],
      ),
    );
  }
  Widget sliderIndicator() => Container(

    margin: EdgeInsets.symmetric(horizontal: 20),
    child: AnimatedSmoothIndicator(
      effect: ExpandingDotsEffect(
        expansionFactor: 4,
        spacing: 12,
        dotWidth: 6,
        dotHeight: 6,
        activeDotColor: Color(0xFFD7FC70),
        dotColor: Color(0xFF626262)
      ),
      activeIndex: activeIndex,
      count: 4,
    ),
  );

  Widget buildImage(Image sliderImage, int index) =>
      Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: sliderImage,
      );

  double resWidthSize(BuildContext context){       // WIDTH and HEIGHT SIZE FOR RESPONSIVE SIZE
    double widthSize;
    if(MediaQuery.of(context).size.width>424)
      widthSize = MediaQuery.of(context).size.width * 0.0092;
    else
      widthSize = MediaQuery.of(context).size.width * 0.01;

    return widthSize;
  }
  double resHeightSize(BuildContext context){
    double heightSize = MediaQuery.of(context).size.height * 0.01;
    return heightSize;
  }
}