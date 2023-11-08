import 'package:clothes_store/config/MediaQuery.dart';
import 'package:clothes_store/config/componets/colors.dart';
import 'package:clothes_store/config/componets/fonts.dart';
import 'package:clothes_store/config/componets/icons.dart';
import 'package:clothes_store/presentation/views/AuthScreens/signup.dart';
import 'package:clothes_store/presentation/wedgets/sharedWedgets/coustomButtom.dart';
import 'package:clothes_store/presentation/wedgets/sharedWedgets/coustomTextFiled.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../models/fire_base_auth.dart';
import '../mainscreens/NavBar.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    final FirebaseAuth _auth = FirebaseAuth.instance;


    return Scaffold(
        body: SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: MyMediaQuerry(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Let’s Sign You In',
              style: TextStyle(
                color: Color(0xFF171717),
                fontSize: 24,
                fontFamily: primaryFont.fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
            18.heightBox,
            Text(
              'Welcome back, you’ve been missed!',
              style: TextStyle(
                color: Color(0xFF171717),
                fontSize: 14,
                fontFamily: primaryFont.fontFamily,
                fontWeight: FontWeight.w500,
                height: 0.12,
                letterSpacing: -0.40,
              ),
            ),
            48.heightBox,
            CoustumTextFilled(
                Label: 'Username or Email',
                MyIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    userIcon,
                  ),
                )),
            30.heightBox,
            CoustumTextFilled(
              textInputType: TextInputType.visiblePassword,
              Label: 'Password',
              MyIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  LockIco,
                ),
              ),
              obscureText: true,
            ),
            180.heightBox,
            CostumButtom(
              text: "Sign In",
              onPressed: () async {
                try {
                  UserCredential userCredential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text);
                  // Handle successful sign in
                  print('User signed in: ${userCredential.user}');
                } catch (e) {
                  // Handle sign in failure
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
                }
              },
              width: 345,
              height: 44,
              color: primaryColor,
              textColor: WhiteColor,
              radius: 10,
              fontSize: 16,
            ),
            6.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?",
                    style: TextStyle(
                      color: Color(0xFF171717),
                      fontSize: 14,
                      fontFamily: primaryFont.fontFamily,
                      fontWeight: FontWeight.w500,
                      height: 0.12,
                      letterSpacing: -0.40,
                    )),
                8.widthBox,
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                    foregroundColor: Color(0xFF171717),
                  ),
                  child: Text("Sign Up",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 14,
                        fontFamily: primaryFont.fontFamily,
                        fontWeight: FontWeight.w500,
                        height: 0.12,
                        letterSpacing: -0.40,
                      )),
                ),
              ],
            ),
            20.heightBox,
            CostumButtom(
              text: "Sign In with Facebook",
              onPressed: () async {

              },
              width: 35,
              height: 44,
              color: blueColor,
              textColor: WhiteColor,
              radius: 10,
              fontSize: 16,
              IconLogo: SvgPicture.asset(
                FacebookIco,
                width: 20,
                height: 20,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
