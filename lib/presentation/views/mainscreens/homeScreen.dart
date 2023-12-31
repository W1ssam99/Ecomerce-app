import 'package:clothes_store/config/componets/icons.dart';
import 'package:clothes_store/presentation/wedgets/mainScreenWedgit/homeScreenWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../generated/l10n.dart';
import '../detailScreens/addPrducts.dart';
import '../detailScreens/favoriteScreen.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});




  @override
  Widget build(BuildContext context) {
    var _Localaization= S.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title:Text(
          _Localaization.Home,
          style: TextStyle(
            fontSize: 20,

            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,

        leading: IconButton(onPressed: () {
        }, icon: SvgPicture.asset(MenuIco)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Favorite()));
              },
              icon:const Icon(
                Icons.favorite_border_outlined,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        10.heightBox,
        Align(
          alignment: Alignment.center,
          child: Text(
            _Localaization.Products,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF171717),
              fontSize: 17,

            ),
          ),
        ),
        35.heightBox,
      const Flexible(child: RowProducts()),
        35.heightBox,
        Container(
            width: double.infinity,
            height: 1,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.3))),
        25.heightBox,
        Align(
          alignment: Alignment.center,
          child: Text(
            _Localaization.RecommendedForYou,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF171717),
              fontSize: 17,

            ),
          ),
        ),
        15.heightBox,
      const  Flexible(child: RowProducts()),
      ]),
    );
  }
}
