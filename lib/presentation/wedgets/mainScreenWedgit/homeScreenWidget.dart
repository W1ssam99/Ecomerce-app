import 'package:clothes_store/config/componets/Lists.dart';
import 'package:clothes_store/config/componets/Lists.dart';
import 'package:clothes_store/config/componets/fonts.dart';
import 'package:clothes_store/config/componets/images.dart';
import 'package:clothes_store/controlers/cubit_for_navbar/home_screen_cubit/homescreen_cubit.dart';
import 'package:clothes_store/models/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../config/componets/Lists.dart';
import '../../../config/componets/Lists.dart';
import '../../../data/localy/fireservies.dart';
import '../../views/detailScreens/productDetil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RowProducts extends StatelessWidget {
  const RowProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final containerWidth = screenWidth * 0.6;
    final containerHeight = containerWidth * 1;

    return BlocProvider(
      create: (context) => HomescreenCubit(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            products.length,
                (index) =>
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetail(product: products[index]),
                        ),
                      );
                    },
                    child: Container(
                      height: containerHeight,
                      width: containerWidth,
                      decoration: BoxDecoration(
                        // Use a network image here, assuming 'data[index].image' is a URL
                        image: DecorationImage(
                          image: NetworkImage(products[index].image ?? ''),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Stack(
                        children: [
                         Container(
                           height: 300,
                            width: containerWidth,
                             child: Column(children: [
                               Container(
                                   height: 150,
                                    width: 300,
                                   child: Image.asset(products[index].image??"",fit: BoxFit.contain,)),
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Align(
                                    alignment: Alignment.centerLeft,
                                   child: Row(
                                     children: [
                                       Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Text(products[index].name??"").text.size(22).make(),
                                           Text(products[index].description??""),
                                           3.heightBox,
                                           Text(products[index].price??""),
                                         ],
                                       ),
                                       Column(
                                         children: [
                                           BlocBuilder<HomescreenCubit, HomescreenState>(
                                             builder: (BuildContext context, state) {
                                               final homescreenCubit = context.read<HomescreenCubit>();
                                               Color iconColor =
                                               homescreenCubit.isProductFavorite(products[index])
                                                   ? Colors.red
                                                   : Colors.black.withOpacity(0.5);

                                               return IconButton(
                                                 onPressed: () {
                                                   homescreenCubit.toggleFavorite(products[index]);

                                                 },
                                                 icon: Icon(LineIcons.heartAlt, color: iconColor),
                                               );
                                             },
                                           ),

                                         ],
                                       )
                                     ],
                                   ),
                                 ),
                               ),
                             ],)


                             )
                        ],
                      ),
                    ),
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
