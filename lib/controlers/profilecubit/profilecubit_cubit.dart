import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profilecubit_state.dart';

class ProfilecubitCubit extends Cubit<ProfilecubitState> {
  ProfilecubitCubit() : super(ProfilecubitInitial());
}
