import 'package:flutter/material.dart';
import 'package:flutter_ui/model/product.dart';

class GridItem extends StatefulWidget {
  final Product product;
  final Function() press;
  GridItem(this.product,this.press);
  _GridItemState createState() => _GridItemState();
}
class _GridItemState extends State<GridItem> {

  Color? favouriteColor = Colors.blue[900];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32)
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(image: AssetImage(widget.product.image),)),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: Color(0xFFC4C4C6),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        if(favouriteColor == Colors.blue[900])
                          favouriteColor = Colors.white;
                        else favouriteColor = Colors.blue[900];
                      });
                    },
                      child: ImageIcon(AssetImage("assets/heart_icon.png"), color: favouriteColor,size: 24,)),

                  ),
                ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(widget.product.name, style: TextStyle(color: Colors.white, fontSize: 16),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(widget.product.price.toString() + "₺", style: TextStyle(color: Colors.white, fontSize: 16),),
          ),
        ],
      ),
    );
  }
}
