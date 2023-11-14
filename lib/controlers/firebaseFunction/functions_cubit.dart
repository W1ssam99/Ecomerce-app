import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'functions_state.dart';

class FunctionsCubit extends Cubit<FunctionsState> {
  FunctionsCubit() : super(FunctionsInitial());
}
