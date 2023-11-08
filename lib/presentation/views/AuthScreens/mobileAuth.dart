import 'package:clothes_store/config/MediaQuery.dart';
import 'package:clothes_store/config/componets/colors.dart';
import 'package:clothes_store/config/componets/fonts.dart';
import 'package:clothes_store/presentation/views/AuthScreens/otp.dart';
import 'package:clothes_store/presentation/wedgets/sharedWedgets/MobileAuthTextFilled.dart';
import 'package:clothes_store/presentation/wedgets/sharedWedgets/coustomButtom.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MobileAuth extends StatelessWidget {
  const MobileAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyMediaQuerry(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password Recovery',
                  style: TextStyle(
                    color: Color(0xFF171717),
                    fontSize: 24,
                    fontFamily: primaryFont.fontFamily,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              8.heightBox,
              Align(
                alignment: Alignment.centerLeft,
                child: Opacity(
                  opacity: 0.60,
                  child: Text(
                    'Enter your Phone number to recover \nyour password',
                    style: TextStyle(
                      color: Color(0xFF171717),
                      fontSize: 14,
                      fontFamily: primaryFont.fontFamily,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              60.heightBox,
              Column(children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Enter your phone number",
                      style: TextStyle(fontFamily: primaryFont.fontFamily),
                    )),
                MobileNumberAuthenticationWidget(),
                63.heightBox,
                CostumButtom(
                    text: "Continue",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OtpScreen()),
                      );
                    },
                    width: 315,
                    height: 44,
                    color: primaryColor,
                    textColor: WhiteColor,
                    radius: 10,
                    fontSize: 18)
              ])
            ],
          ),
        ),
      ),
    );
  }
}
