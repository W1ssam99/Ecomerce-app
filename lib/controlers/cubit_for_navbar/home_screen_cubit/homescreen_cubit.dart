import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../config/componets/Lists.dart';
import '../../../models/productmodel.dart';

part 'homescreen_state.dart';

class HomescreenCubit extends Cubit<HomescreenState> {
  HomescreenCubit() : super(HomescreenInitial());

  void toggleFavorite(Products product) {
    if (favoriteProducts.contains(product)) {
      favoriteProducts.remove(product);
    } else {
      favoriteProducts.add(product);
    }
    emit(FavoriteProducts());
  }
}

