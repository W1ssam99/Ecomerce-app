import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/componets/fonts.dart';
import '../../../config/componets/lists.dart';
import '../../../controlers/cubit_for_navbar/home_screen_cubit/homescreen_cubit.dart';

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => HomescreenCubit(),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartProducts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 150, // Adjusted the height for better visibility
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
                                  cartProducts[index].image ?? 'default value',
                                ),
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
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${cartProducts[index].price}",
                                style: TextStyle(
                                  fontFamily: primaryFont.fontFamily,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {

                            },
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
