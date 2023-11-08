import 'package:clothes_store/config/MediaQuery.dart';
import 'package:clothes_store/config/componets/colors.dart';
import 'package:clothes_store/config/componets/fonts.dart';
import 'package:clothes_store/config/componets/images.dart';
import 'package:clothes_store/presentation/views/AuthScreens/login.dart';
import 'package:clothes_store/presentation/wedgets/sharedWedgets/coustomButtom.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MyMediaQuerry(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(onBoardingImage, width: 300, height: 300),
            110.heightBox,
            Align(
                alignment: Alignment.center,
                child: Text(
                  'Welcome to STStore !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF171717),
                    fontSize: 24,
                    fontFamily: primaryFont.fontFamily,
                    fontWeight: FontWeight.w700,
                  ),
                )),
            15.heightBox,
            Text(
              'With long experience in the audio industry,\n we create the best quality products',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF171717),
                fontSize: 14,
                fontFamily: primaryFont.fontFamily,
                fontWeight: FontWeight.w500,
              ),
            ),
            90.heightBox,
            CostumButtom(
                text: 'Get Started',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogIn()),
                  );
                },
                width: 315,
                height: 44,
                color: primaryColor,
                textColor: WhiteColor,
                radius: 10,
                fontSize: 16),
          ],
        ),
      ),
    ));
  }
}
