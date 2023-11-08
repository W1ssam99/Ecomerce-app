import 'package:clothes_store/config/componets/fonts.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ShippingAdress extends StatelessWidget {
  const ShippingAdress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Shipping Adress",
            style: TextStyle(
                fontFamily: primaryFont.fontFamily,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Home Adress",
            style: TextStyle(
                fontFamily: primaryFont.fontFamily,
                color: Colors.black,
                fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Streat 1, House 2, Road 3, Block 4,",
            style: TextStyle(
                fontFamily: primaryFont.fontFamily,
                color: Colors.black,
                fontSize: 18),
          ),
        ),
      ],
    ).box.size(370, 150).rounded.color(Color(0xFFf3f6f8)).make());
  }
}
