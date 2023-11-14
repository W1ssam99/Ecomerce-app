import 'package:clothes_store/config/MediaQuery.dart';
import 'package:clothes_store/config/componets/colors.dart';
import 'package:clothes_store/config/componets/fonts.dart';
import 'package:clothes_store/config/componets/icons.dart';
import 'package:clothes_store/presentation/views/AuthScreens/login.dart';
import 'package:clothes_store/presentation/views/AuthScreens/mobileAuth.dart';
import 'package:clothes_store/presentation/wedgets/sharedWedgets/coustomButtom.dart';
import 'package:clothes_store/presentation/wedgets/sharedWedgets/coustomTextFiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../controlers/auth/auth_cubit.dart';
import '../../../generated/l10n.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isChecked = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var _Localaization= S.of(context);

    return Scaffold(
        body: SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: MyMediaQuerry(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
        _Localaization.GettingStarted,
              style: TextStyle(
                color: Color(0xFF171717),
                fontSize: 24,
                fontFamily: primaryFont.fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
            18.heightBox,
            Text(_Localaization.GettingStarted,
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
                Label: _Localaization.UsernameOrEmail,
                MyIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    MailIco,
                  ),
                )),
            30.heightBox,
            CoustumTextFilled(
              controller: _usernameController,
              textInputType: TextInputType.visiblePassword,
              Label: _Localaization.Username,
              MyIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  userIcon,
                ),
              ),
              obscureText: true,
            ),
            30.heightBox,
            CoustumTextFilled(
              controller: _passwordController,
              textInputType: TextInputType.visiblePassword,
              Label: _Localaization.Password,
              MyIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  LockIco,
                ),
              ),
              obscureText: true,
            ),
            30.heightBox,
            Row(
              children: [
                Checkbox(
                  activeColor: primaryColor,
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                ),
                  Text(
                    _Localaization.termsconditions,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                 ],
            ),
            25.heightBox,
            BlocProvider(
              create: (context) => AuthenticationCubit(),
              child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
                builder: (context, state) {
                  return CostumButtom(
                    width: 345,
                    height: 44,
                    color: primaryColor,
                    textColor: WhiteColor,
                    radius: 10,
                    fontSize: 16,
                    text: _Localaization.Signup,
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool("isLogin", true);
                      if (_emailController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty) {
                        context.read<AuthenticationCubit>().signUp(
                          username: _usernameController.text,
                            context: context,
                            email: _emailController.text,
                            password: _passwordController.text,
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MobileAuth()),
                        );

                      } else {
                        context.read<AuthenticationCubit>().showSnackBar(
                            context: context,
                            message: "Please enter your email and password");
                      }
                    },
                  );
                },
              ),
            ),
            1.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_Localaization.AlreadyHaveAnAccount,
                    style: TextStyle(
                      color: Color(0xFF171717),
                      fontSize: 14,
                      fontFamily: primaryFont.fontFamily,
                      fontWeight: FontWeight.w500,
                    )),
                8.widthBox,
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogIn()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                    foregroundColor: Color(0xFF171717),
                  ),
                  child: Text(_Localaization.sign,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 14,
                        fontFamily: primaryFont.fontFamily,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ],
            ),
            11.heightBox,
            CostumButtom(
              text: _Localaization.SignUpWithFacebook,
              onPressed: () {
                //add sign in aniomsly
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MobileAuth()));
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
