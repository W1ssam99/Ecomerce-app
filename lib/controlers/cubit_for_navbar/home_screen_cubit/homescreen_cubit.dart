import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../config/componets/Lists.dart';
import '../../../models/productmodel.dart';

part 'homescreen_state.dart';

class HomescreenCubit extends Cubit<HomescreenState> {
  HomescreenCubit() : super(HomescreenInitial());

  Color toogleColor = Colors.black;

  bool isProductFavorite(Products product) {
    return favoriteProducts.contains(product);
  }

  void toggleFavorite(Products product) {
    if (favoriteProducts.contains(product)) {
      favoriteProducts.remove(product);
      toogleColor = Colors.black; // Set color when not favorite
    } else {
      favoriteProducts.add(product);
      toogleColor = Colors.red; // Set color when favorite
    }
    emit(FavoriteProducts());
  }





  void addToCart(Products product) {
    if (cartProducts.contains(product)) {
      cartProducts.remove(product);
    } else {
      cartProducts.add(product);
    }
    emit(AddToCart());
  }

  void removeFromCart(Products product) {
    cartProducts.removeWhere((item) => item == product);
    print('Product removed from cart: $product');
    emit(RemoveFromCart());
  }

  void clearCart() {
    cartProducts.clear();
    emit(RemoveFromCart());
  }
}
