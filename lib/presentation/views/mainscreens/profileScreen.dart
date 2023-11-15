import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../controlers/profilecubit/profilecubit_cubit.dart';
import '../../../generated/l10n.dart';
import '../../wedgets/detaileScreenWedget/languseScreen.dart';
import '../AuthScreens/signup.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _localization = S.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: _localization.Profile.text.color(Colors.black).make(),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
                  ),
                ),
                10.widthBox,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocProvider(
                      create: (context) => ProfileCubit()..fetchUsername(), // Initialize and fetch username
                      child: BlocBuilder<ProfileCubit, ProfileState>(
                        builder: (context, state) {
                          if (state is ProfileLoading) {
                            return Center(child: CircularProgressIndicator());
                          } else if (state is ProfileLoaded) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${state.username}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            );
                          } else if (state is ProfileError) {
                            return Center(
                              child: Text(
                                'Error: ${state.errorMessage}',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red),
                              ),
                            );
                          } else {
                            return Center(
                              child: Text(
                                'Unknown state',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    5.heightBox,
                    Text("Tajura,Bair Alousta Milad,libya",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.8))),
                  ],
                ),
              ],
            ),
            44.heightBox,
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: 400,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 44.0, right: 44),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.shopping_bag,
                              color: Colors.black,
                            ),
                            20.widthBox,
                            Text(
                              _localization.OrderHistory,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        25.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              EvaIcons.menu2Outline,
                              color: Colors.black,
                            ),
                            20.widthBox,
                            Text(
                              _localization.Notifications,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            Spacer(),
                            Transform.scale(
                              scale: 0.9,
                              // Adjust the scale factor according to your preference
                            )
                          ],
                        ),
                        25.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.language,
                              color: Colors.black,
                            ),
                            20.widthBox,
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Languge()),
                                );
                              },
                              child: Text(
                                _localization.Language,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        30.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.dark_mode,
                              color: Colors.black,
                            ),
                            20.widthBox,
                            Text(
                              _localization.ChangeTheme,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            Spacer(),
                            Transform.scale(
                              scale: 0.9,
                              // Adjust the scale factor according to your preference
                            )
                          ],
                        ),
                        25.heightBox,
                        BlocProvider(
                          create: (context) => UserCubit(),
                          child: BlocBuilder<UserCubit,UserState>(
                            builder: (BuildContext context, state) =>
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),

                              onPressed: () {

                                context.read<UserCubit>().logout();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()),
                                );
                              },
                              child: Text(
                                _localization.LogOut,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
