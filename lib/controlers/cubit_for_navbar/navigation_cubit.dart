import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());

  void changeIndex(int index) {
    switch (index) {
      case 0:
        emit(NavigationHome());
        break;
      case 1:
        emit(NavigationSearch());
        break;
      case 2:
        emit(NavigationOrder());
        break;
      case 3:
        emit(NavigationProfile());
        break;
      default:
        emit(NavigationInitial());
    }
  }
}