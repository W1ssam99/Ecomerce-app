import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clothes_store/config/componets/fonts.dart';
import 'package:flutter/material.dart';

import '../../../config/componets/Lists.dart';
import '../../../controlers/cubit_for_navbar/home_screen_cubit/homescreen_cubit.dart';


class Favorite extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Favorite",
          style: TextStyle(
              fontFamily: primaryFont.fontFamily,
              fontSize: 20,
              color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
    body:BlocProvider(
      create: (context)=>HomescreenCubit(),
      child: SingleChildScrollView(
        child: Column(
children: [  Container(
  height: MediaQuery.of(context).size.height,
    child: ListView.builder(
            itemCount: favoriteProducts.length,
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
                                favoriteProducts[index].image ?? 'default value'),
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
                            favoriteProducts[index].name ?? 'default value',
                            style: TextStyle(
                                fontFamily: primaryFont.fontFamily,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            favoriteProducts[index].price ?? "default value",
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
                            Icons.favorite,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ),
              );
            }
        ),
    )
]
),
      ),
    )
    );
  }
}
