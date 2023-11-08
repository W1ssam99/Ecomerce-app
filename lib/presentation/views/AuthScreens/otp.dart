import 'package:clothes_store/config/MediaQuery.dart';
import 'package:clothes_store/config/componets/colors.dart';
import 'package:clothes_store/config/componets/fonts.dart';
import 'package:clothes_store/presentation/views/mainscreens/NavBar.dart';
import 'package:clothes_store/presentation/wedgets/sharedWedgets/OtpCoustomFilled.dart';
import 'package:clothes_store/presentation/wedgets/sharedWedgets/coustomButtom.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
                  'OTP Authentication',
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
                    'An authentication code has been \nsent to ********}',
                    style: TextStyle(
                      color: const Color(0xFF171717),
                      fontSize: 14,
                      fontFamily: primaryFont.fontFamily,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              60.heightBox,
              Column(children: [
                OTPTextField(
                  length: 4,
                  onSubmitted: (value) {
                    print(value);
                  },
                ),
                63.heightBox,
                CostumButtom(
                    text: "Continue",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Navigation_Bar()),
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
