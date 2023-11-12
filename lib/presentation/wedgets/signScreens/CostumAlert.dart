import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../config/componets/fonts.dart';
import '../../../config/componets/images.dart';
import '../../views/AuthScreens/signup.dart';

class CostumAlert extends StatelessWidget {
  const CostumAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: MediaQuery.of(context).size.height * 0.23,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 1,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                errorIco, // Correct syntax for AssetImage
                width: 50,
                height:50,
              ),
            ),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Opps!",style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,fontFamily: primaryFont.fontFamily),),
                6.widthBox,
                Text("You Don't Have Account",style: TextStyle(fontSize:18,fontWeight: FontWeight.w500,fontFamily: primaryFont.fontFamily),),
              ],),
            10.heightBox,
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
            }, child: Text("Create Account",style: TextStyle(fontSize:18,fontWeight: FontWeight.w500,fontFamily: primaryFont.fontFamily),))
          ],
        )
    );
  }
}
