import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'functions_state.dart';



class UpdateThemeSwitchCubit extends Cubit<bool> {
  UpdateThemeSwitchCubit() : super(false);

  void updateThemeSwitch(bool value) {
    emit(value);
  }
}
