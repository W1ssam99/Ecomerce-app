part of 'homescreen_cubit.dart';

@immutable
abstract class HomescreenState {}

class HomescreenInitial extends HomescreenState {}

class FavoriteProducts extends HomescreenState {}

class AddToCart extends HomescreenState {}

class RemoveFromCart extends HomescreenState {}

