import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
part 'profilecubit_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      emit(UserNotAuthenticated());
    } catch (e) {
      print(e);
      emit(UserNotAuthenticated());
    }
  }
}


class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileLoading());

  Future<void> fetchUsername() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        DocumentSnapshot userData = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (userData.exists) {
          String username = userData['username'];
          String email = userData['email'];
          emit(ProfileLoaded(username , email));
        } else {
          emit(ProfileError('User data not found'));
        }
      } else {
        emit(ProfileError('User is null'));
      }
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  void clearProfile() {
    emit(ProfileLoading());
  }
}
