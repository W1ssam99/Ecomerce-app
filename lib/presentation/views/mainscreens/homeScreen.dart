import 'package:clothes_store/config/componets/icons.dart';
import 'package:clothes_store/presentation/wedgets/mainScreenWedgit/homeScreenWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unicons/unicons.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../generated/l10n.dart';
import '../detailScreens/addPrducts.dart';
import '../detailScreens/favoriteScreen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _localization = S.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _localization.Home,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            UniconsLine.list_ui_alt,
            color: Colors.black,
            size: 28,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Favorite()),
              );
            },
            icon: const Icon(
              UniconsLine.heart,
              color: Colors.black,
              size: 28,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          10.heightBox,
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _localization.Products,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF171717),
                  fontSize: 17,
                ),
              ),
            ),
          ),
          35.heightBox,
          Expanded(
            child: Flexible(
              child: RowProducts(),
            ),
          ),
          35.heightBox,
          Container(
            width: MediaQuery.of(context).size.width*0.95,
            height: 1,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
          ),
          25.heightBox,
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _localization.RecommendedForYou,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF171717),
                  fontSize: 17,
                ),
              ),
            ),
          ),
          15.heightBox,
          Expanded(
            child: Flexible(
              child: RowProducts(),
            ),
          ),

        ],
      ),
    );
  }
}