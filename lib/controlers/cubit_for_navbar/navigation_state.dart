part of 'navigation_cubit.dart';

@immutable
abstract class NavigationState {}

class NavigationInitial extends NavigationState {}

class NavigationHome extends NavigationState {}

class NavigationSearch extends NavigationState {}

class NavigationOrder extends NavigationState {}

class NavigationProfile extends NavigationState {}