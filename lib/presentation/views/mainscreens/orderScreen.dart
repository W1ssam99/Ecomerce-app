import 'dart:convert';

import 'package:clothes_store/services/chekOutToFirebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clothes_store/config/componets/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import '../../../config/componets/Lists.dart';
import '../../../config/componets/colors.dart';
import '../../../controlers/cubit_for_navbar/home_screen_cubit/homescreen_cubit.dart';
import '../../../generated/l10n.dart';
import '../../wedgets/sharedWedgets/coustomButtom.dart';


class OrderScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var _localization = S.of(context);


    double total =0;
    for(int i=0;i<cartProducts.length;i++){
      total+=cartProducts[i].price!;
    }


    void sendEmail() async {
      final url = Uri.parse('http://localhost:3000/send-email');
      final headers = {'Content-Type': 'application/json'};
      final body = {
        'to': 'wissamalmsalati@gmail.com',
        'subject': 'Test Sending email',
        'text': 'Test',
      };

      try {
        final response = await http.post(url, headers: headers, body: jsonEncode(body));
        if (response.statusCode == 200) {
          print('Email sent successfully.');
        } else {
          print('Failed to send email: ${response.body}');
        }
      } catch (e) {
        print('Error sending email: $e');
      }
    }


    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            _localization.Orders,
            style: TextStyle(
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
              return state is RemoveFromCart  ? Center(child: Text("Not Have Any Thing In Cart")) :  Column(
                  children: [
                    Container(
                    height: MediaQuery.of(context).size.height*0.64,
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
                                        fit: BoxFit.contain,
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
                                        "${cartProducts[index].price}",
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
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_localization.TotalPrice,style: TextStyle(
                                fontSize: 20,
                                color: Colors.black),),
                            SizedBox(width: 10,),
                          Text("${total}"  ?? "default value",style: TextStyle(
                              fontFamily: primaryFont.fontFamily,
                              fontSize: 20,
                              color: Colors.black),
                          ),
                          ],

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
                      child: CostumButtom(
              width: MediaQuery.of(context).size.width*0.1, height: MediaQuery.of(context).size.height*0.067, color: primaryColor, textColor: Colors.white, radius: 13, fontSize: 18,
                        text: _localization.Checkout,
                        onPressed: () async {
                          sendEmail();
                          context.read<HomescreenCubit>().removeFromCart(cartProducts[0]);
                          context.showToast(msg: "Order Done");


                        },

                      ),
                    ),

                  ]
              );
            },
            ),
          ),
    );
  }
}
