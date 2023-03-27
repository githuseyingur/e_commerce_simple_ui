import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  _CategoriesState createState() => _CategoriesState();
}
class _CategoriesState extends State<Categories> {
  List<String> categories = ["Newest", "Accessories", "Hoodie", "Dresses"];
  int selectedTab = 0;

  Color selectedColor = Color(0xFFD7FC70);
  Color unselectedColor = Color(0xFF2B2B2B);

  @override
  Widget build(BuildContext context) {
   return  ListView.builder(
       scrollDirection: Axis.horizontal,
       itemCount: categories.length,
       itemBuilder: (context,index) => categoriesWidget(index),
     );
  }
  Widget categoriesWidget(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedTab = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 12),
        width: 140,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: selectedTab == index ? selectedColor : unselectedColor
        ),
          child:Text(categories[index],style: TextStyle(color: selectedTab==index ? Colors.black : Colors.white, fontSize: 15, fontWeight: FontWeight.w500),),
        ),
    );
  }
}
