import 'package:clothes_store/config/componets/images.dart';
import 'package:clothes_store/presentation/views/mainscreens/NavBar.dart';
import 'package:clothes_store/presentation/views/mainscreens/homeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clothes_store/config/componets/fonts.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../config/componets/Lists.dart';
import '../../../config/componets/colors.dart';
import '../../../config/componets/function.dart';
import '../../../controlers/cubit_for_navbar/home_screen_cubit/homescreen_cubit.dart';
import '../../../controlers/profilecubit/profilecubit_cubit.dart';
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
      body: BlocProvider(
        create: (context) => HomescreenCubit(),
        child: BlocBuilder<HomescreenCubit, HomescreenState>(
          builder: (context, state) {
            if (cartProducts.isEmpty) {
              return Center(
                child: Container(
                  height: 300,
                  width: 300,
                  child: Column(
                    children: [
                      Image.asset(EmptyCart),
                      10.heightBox,
                      Text(
                        "Your Cart Is Empty ",
                        style: TextStyle(
                            fontFamily: primaryFont.fontFamily,
                            fontSize: 20,
                            color: Colors.black.withOpacity(0.6)),
                      ),
                      15.heightBox,
                      CostumButtom(
                          text: "StartShopping",
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Navigation_Bar()));
                          },
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.06,
                          color: primaryColor,
                          textColor: Colors.white,
                          radius: 10,
                          fontSize: 18)
                    ],
                  ),
                ),
              );
            } else {
              return state is RemoveFromCart
                  ? Center(
                      child: Container(
                          height: 200,
                          width: 200,
                          child: Image.asset(EmptyCart)))
                  : Column(children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.71,
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                cartProducts[index].image ??
                                                    'default value'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cartProducts[index].name ??
                                                'default value',
                                            style: TextStyle(
                                                fontFamily:
                                                    primaryFont.fontFamily,
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            cartProducts[index].price ??
                                                "default value",
                                            style: TextStyle(
                                                fontFamily:
                                                    primaryFont.fontFamily,
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      IconButton(
                                        onPressed: () {
                                          BlocProvider.of<HomescreenCubit>(
                                                  context)
                                              .removeFromCart(
                                                  cartProducts[index]);
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
                            }),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20, bottom: 20),
                          child: BlocProvider(
                            create: (context) =>
                                ProfileCubit()..fetchUsername(),
                            child: BlocBuilder<ProfileCubit, ProfileState>(
                              builder: (context, state) {
                                if (state is ProfileLoaded) {
                                  return CostumButtom(
                                    text: "CheckOut",
                                    onPressed: () async {
                                      FirebaseFirestore firestore =
                                          FirebaseFirestore.instance;

                                      String userId = "user123";

                                      CollectionReference orders =
                                          firestore.collection('orders');

                                      DocumentReference orderDoc = orders.doc(
                                          DateTime.now().toIso8601String());

                                      // Add the order details to the document
                                      await orderDoc.set({
                                        'userId': userId,
                                        'products': cartProducts
                                            .map((product) => {
                                                  'name': product.name,
                                                  'price': product.price,
                                                  // Add other product details as needed
                                                })
                                            .toList(),
                                        'timestamp':
                                            FieldValue.serverTimestamp(),
                                        // Add a timestamp for when the order was created
                                      });

                                      String email = state.email;

                                      // Send an email to the user
                                      MyFunctions.sendEmail(email);

                                      BlocProvider.of<HomescreenCubit>(context)
                                          .clearCart();

                                      // Show a success message
                                      context.showToast(msg: "CheckOut Done");
                                    },
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    height: MediaQuery.of(context).size.height *
                                        0.067,
                                    color: primaryColor,
                                    textColor: Colors.white,
                                    radius: 13,
                                    fontSize: 18,
                                  );
                                } else {
                                  return Container(
                                      height: 200,
                                      width: 200,
                                      child: Image.asset(EmptyCart));
                                }
                              },
                            ),
                          )),
                    ]);
            }
          },
        ),
      ),
    );
  }
}
