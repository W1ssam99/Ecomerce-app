import 'package:clothes_store/config/MediaQuery.dart';
import 'package:clothes_store/config/componets/colors.dart';
import 'package:clothes_store/config/componets/fonts.dart';
import 'package:clothes_store/config/componets/icons.dart';
import 'package:clothes_store/controlers/auth/auth_cubit.dart';
import 'package:clothes_store/presentation/views/AuthScreens/signup.dart';
import 'package:clothes_store/presentation/wedgets/sharedWedgets/coustomButtom.dart';
import 'package:clothes_store/presentation/wedgets/sharedWedgets/coustomTextFiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import '../mainscreens/NavBar.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

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
                controller: _emailController,
                Label: 'Username or Email',
                MyIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    userIcon,
                  ),
                )),
            30.heightBox,
            CoustumTextFilled(
              controller: _passwordController,
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
            BlocProvider(
              create: (context) => AuthenticationCubit(),
              child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
                builder: (context, state) {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: primaryColor, // background color
                        onPrimary: WhiteColor, // text color
                        minimumSize: Size(345, 44), // size
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // border radius
                        ),
                      ),
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontSize: 16),
                      ),
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setBool("isLogin", true);
                        if (_emailController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty) {
                          context.read<AuthenticationCubit>().signIn(
                                context: context,
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                        } else {
                          context.read<AuthenticationCubit>().showSnackBar(
                              context: context,
                              message: "Please enter your email and password");
                        }
                      });
                },
              ),
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
              onPressed: () async {},
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
