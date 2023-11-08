import 'package:flutter/material.dart';
import '../../../config/componets/fonts.dart';
import '../../../config/componets/images.dart';

class ProductCard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    int value = 1;
    return Container(
      height: 168,
      width: 340,
      decoration: BoxDecoration(
        color: Color(0xFFf3f6f8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 30,
            child: Image.asset(
              Product2,
              height: 110,
              width: 110,
            ),
          ),
          Positioned(
            left: 150,
            top: 30,
            child: Text(
              "Product Name",
              style: TextStyle(
                fontFamily: primaryFont.fontFamily,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            left: 150,
            top: 70,
            child: Text(
              "Price",
              style: TextStyle(
                fontFamily: primaryFont.fontFamily,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            left: 130,
            top: 110,
            child: Row(
              children: [
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.add),
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(child: Text("$value")),
                ),
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.remove),
                ),
              ],
            ),
          ),
          Positioned(
            left: 280,
            top: 110,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
            ),
          ),
        ],
      ),
    );
  }
}