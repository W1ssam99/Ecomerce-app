import 'package:clothes_store/config/componets/colors.dart';
import 'package:clothes_store/config/componets/fonts.dart';
import 'package:clothes_store/presentation/views/detailScreens/chekoutScreen.dart';
import 'package:clothes_store/presentation/wedgets/sharedWedgets/coustomButtom.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../wedgets/mainScreenWedgit/orderScreenWidget.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: "Order".text.color(Colors.black).bold.make(),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 540,
              width: 400,
              child: Column(
                children: List.generate(1, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProductCard(),
                  );
                }),
              ),
            ),
            Container(
              height: 170,
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 1,
                    width: 400,
                    color: Colors.black.withOpacity(0.2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Text(
                            "Total",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: primaryFont.fontFamily,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, top: 20),
                          child: Text(
                            "EGP 200",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: primaryFont.fontFamily,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 20, left: 35, right: 35, top: 20),
                    child: CostumButtom(
                        text: "Checkout",
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckOut()));
                        },
                        width: 300,
                        height: 55,
                        color: primaryColor,
                        textColor: Colors.white,
                        radius: 10,
                        fontSize: 20),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
