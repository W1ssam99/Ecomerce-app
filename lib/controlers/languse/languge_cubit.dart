import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'languge_state.dart';

class LangugeCubit extends Cubit<LangugeState> {
  LangugeCubit() : super(LangugeInitial());
}
