import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clothes_store/config/componets/fonts.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../config/componets/Lists.dart';
import '../../../config/componets/colors.dart';
import '../../../controlers/cubit_for_navbar/home_screen_cubit/homescreen_cubit.dart';
import '../../wedgets/sharedWedgets/coustomButtom.dart';


class OrderScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Order",
            style: TextStyle(
                fontFamily: primaryFont.fontFamily,
                fontSize: 20,
                color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body:BlocProvider(
          create: (context)=>HomescreenCubit(),
          child: BlocBuilder<HomescreenCubit,HomescreenState>(
            builder: (context, state) {
              return state is RemoveFromCart ? Center(child: CircularProgressIndicator()) :  Column(
                  children: [
                    Container(
                    height: MediaQuery.of(context).size.height*0.71,
                    child: ListView.builder(
                        itemCount: cartProducts.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            cartProducts[index].image ?? 'default value'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cartProducts[index].name ?? 'default value',
                                        style: TextStyle(
                                            fontFamily: primaryFont.fontFamily,
                                            fontSize: 20,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        cartProducts[index].price ?? "default value",
                                        style: TextStyle(
                                            fontFamily: primaryFont.fontFamily,
                                            fontSize: 20,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  IconButton(
                                          onPressed: () {
                                            BlocProvider.of<HomescreenCubit>(context).removeFromCart(cartProducts[index]);
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.black,
                                  ),
                                  ),

                                ],
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
                      child: CostumButtom(text: "CheckOut", onPressed: () async {
              // Create a reference to the Firebase Firestore database
              FirebaseFirestore firestore = FirebaseFirestore.instance;

              // Get the current user's ID or use any unique identifier for the order
              String userId = "user123"; // Replace with your actual user ID logic

              // Create a reference to the orders collection in Firebase
              CollectionReference orders = firestore.collection('orders');

              // Create a new order document with the current timestamp as its ID
              DocumentReference orderDoc = orders.doc(DateTime.now().toIso8601String());

              // Add the order details to the document
              await orderDoc.set({
              'userId': userId,
              'products': cartProducts.map((product) => {
              'name': product.name,
              'price': product.price,
              // Add other product details as needed
              }).toList(),
              'timestamp': FieldValue.serverTimestamp(), // Add a timestamp for when the order was created
              });

              // Clear the cart or perform any other necessary actions
              BlocProvider.of<HomescreenCubit>(context).clearCart();

              // Show a success message
              context.showToast(msg: "CheckOut Done");
              }, width: MediaQuery.of(context).size.width*0.1, height: MediaQuery.of(context).size.height*0.067, color: primaryColor, textColor: Colors.white, radius: 13, fontSize: 18),
                    ),
                  ]
              );
            },
            ),
          ),
    );
  }
}
