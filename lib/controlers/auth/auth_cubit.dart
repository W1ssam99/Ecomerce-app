// authentication_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:clothes_store/config/componets/images.dart';
import 'package:clothes_store/presentation/views/AuthScreens/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../presentation/views/AuthScreens/mobileAuth.dart';
import '../../presentation/views/mainscreens/NavBar.dart';
import '../../presentation/wedgets/signScreens/CostumAlert.dart';

part 'auth_state.dart';


class AuthenticationCubit extends Cubit<AuthenticationState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthenticationCubit() : super(UnauthenticatedState());

  Future<void> signUp({
    required String email,
    required String password,
    required String username, // Add username parameter
    required BuildContext context,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(

        email: email,
        password: password,
      );

      if (_firebaseAuth.currentUser != null) {
        await FirebaseFirestore.instance.collection('users').doc(_firebaseAuth.currentUser!.uid).set({
          'email': email,
          'password': password,
          'username': username,
        });
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, message: e.message ?? "An error occurred");
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (_firebaseAuth.currentUser != null) {
        DocumentSnapshot userData = await FirebaseFirestore.instance
            .collection('users')
            .doc(_firebaseAuth.currentUser!.uid)
            .get();

        if (userData.exists) {
          String username = userData['username'];
          String email = userData['email'];
          print('Username: $username');
          print('Email: $email');
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Navigation_Bar(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) =>
            Center(
              child: CostumAlert(),
            ),
      );
    }
  }



  void showSnackBar({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
