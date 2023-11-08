import 'package:clothes_store/config/componets/Lists.dart';
import 'package:clothes_store/config/componets/fonts.dart';
import 'package:clothes_store/config/componets/images.dart';
import 'package:clothes_store/controlers/cubit_for_navbar/home_screen_cubit/homescreen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../models/productmodel.dart';

class RowProducts extends StatelessWidget {
  const RowProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth * 0.6;
    final containerHeight = containerWidth * 1 ;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          products.length,
              (index) => Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              height: containerHeight,
              width: containerWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(BG), // for local images
                  fit: BoxFit.contain,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -15,
                    right: 0,
                    left: 0,
                    child: Center(
                      child: Container(
                        height: containerWidth * 0.76,
                        width: containerWidth * 0.76,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              products[index].image ?? 'default value',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: containerHeight * 0.06),
                  Positioned(
                    bottom: containerHeight * 0.06,
                    left: containerWidth * 0.06,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products[index].name ?? 'default value',
                          style: TextStyle(
                            color: Color(0xFF171717),
                            fontSize: 14,
                            fontFamily: primaryFont.fontFamily,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: containerHeight * 0.04),
                        Text(
                          products[index].description ?? 'default value',
                          style: TextStyle(
                            color: Color(0xFF171717),
                            fontSize: 12,
                            fontFamily: primaryFont.fontFamily,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: containerHeight * 0.04),
                        Text(
                          '\$ ${products[index].price}',
                          style: TextStyle(
                            color: Color(0xFF171717),
                            fontSize: 14,
                            fontFamily: primaryFont.fontFamily,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: containerHeight * 0.06,
                    right: containerWidth * 0.06,
                    child: BlocProvider(
                      create: (context) => HomescreenCubit(),
                      child: BlocBuilder<HomescreenCubit, HomescreenState>(
                        builder: (context, state) {
                          final bool isFavorite =
                          favoriteProducts.contains(products[index]);
                          return IconButton(
                            onPressed: () {
                              context
                                  .read<HomescreenCubit>()
                                  .toggleFavorite(products[index]);
                            },
                            icon: Icon(
                              isFavorite ? LineIcons.heartAlt : LineIcons.heart,
                              color: isFavorite ? Colors.red : Colors.black,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}