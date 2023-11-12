import 'package:clothes_store/config/componets/colors.dart';
import 'package:clothes_store/config/componets/fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../config/componets/images.dart';
import '../AuthScreens/signup.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = '';
  String userEmail = '';
  bool isSwitched = false;
  bool isSwitchedNotifi = false;


  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .get();

      if (userData.exists) {
        setState(() {
          userName = userData['username'];
          userEmail = userData['email'];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: "Profile".text.color(Colors.black).bold.make(),
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
                    Text(
                      userName,
                      style: TextStyle(
                          fontFamily: primaryFont.fontFamily,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    5.heightBox,
                    Text("Tajura,Bair Alousta Milad,libya",
                        style: TextStyle(
                            fontFamily: primaryFont.fontFamily,
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.8))),
                  ],
                ),
              ],
            ),
            44.heightBox,
            Container(
              height: MediaQuery.of(context).size.height*0.6,
              width: 400,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:44.0,right: 44),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start ,
                          children: [
                               Icon(
                                Icons.shopping_bag,
                                color: Colors.black,
                              ),
                            20.widthBox,
                            Text(
                              "Order History",
                              style: TextStyle(
                                  fontFamily: primaryFont.fontFamily,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        25.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start ,
                          children: [
                            Icon(
                              Icons.notifications,
                              color: Colors.black,
                            ),
                            20.widthBox,
                            Text(
                              "Notifications",
                              style: TextStyle(
                                  fontFamily: primaryFont.fontFamily,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            Spacer(),
                            Transform.scale(
                              scale:0.9, // Adjust the scale factor according to your preference
                              child: Switch(
                                value: isSwitchedNotifi,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitchedNotifi = value;
                                  });
                                },
                              ),
                            )

                          ],
                        ),
                        25.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start ,
                          children: [
                            Icon(
                              Icons.language,
                              color: Colors.black,
                            ),
                            20.widthBox,
                            Text(
                              "Language",
                              style: TextStyle(
                                  fontFamily: primaryFont.fontFamily,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        30.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start ,
                          children: [
                            Icon(
                              Icons.dark_mode,
                              color: Colors.black,
                            ),
                            20.widthBox,
                            Text(
                              "Change Theme",
                              style: TextStyle(
                                  fontFamily: primaryFont.fontFamily,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            Spacer(),
                            Transform.scale(
                              scale: 0.9, // Adjust the scale factor according to your preference
                              child: Switch(
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched = value;
                                  });
                                },
                              ),
                            )

                          ],
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

// ...
}
