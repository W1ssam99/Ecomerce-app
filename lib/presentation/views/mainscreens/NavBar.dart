import 'package:clothes_store/config/componets/colors.dart';
import 'package:clothes_store/presentation/views/mainscreens/homeScreen.dart';
import 'package:clothes_store/presentation/views/mainscreens/orderScreen.dart';
import 'package:clothes_store/presentation/views/mainscreens/profileScreen.dart';
import 'package:clothes_store/presentation/views/mainscreens/searchScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controlers/cubit_for_navbar/navigation_cubit.dart';

class Navigation_Bar extends StatelessWidget {
  final List Screens = [
   const HomeScreen(),
    SearchScreen(),
   const OrderScreen(),
   const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          int _currentIndex = 0;
          if (state is NavigationHome) {
            _currentIndex = 0;
          } else if (state is NavigationSearch) {
            _currentIndex = 1;
          } else if (state is NavigationOrder) {
            _currentIndex = 2;
          } else if (state is NavigationProfile) {
            _currentIndex = 3;
          }
          return Scaffold(
            body: Screens[_currentIndex],
            bottomNavigationBar: Padding(
              padding:
                  const EdgeInsets.only(bottom: 9, top: 5, left: 6, right: 6),
              child: GNav(
                  backgroundColor: Colors.white,
                  gap: 6,
                  activeColor: Colors.black,
                  iconSize: 25,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: primaryColor,
                  color: Colors.black,
                  tabs:const [
                    GButton(
                      icon: LineIcons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: LineIcons.search,
                      text: 'Search',
                    ),
                    GButton(
                      icon: LineIcons.shoppingBag,
                      text: 'Order',
                    ),
                    GButton(
                      icon: LineIcons.user,
                      text: 'Profile',
                    ),
                  ],
                  selectedIndex: _currentIndex,
                  onTabChange: (index) {
                    context.read<NavigationCubit>().changeIndex(index);
                  }),
            ),
          );
        },
      ),
    );
  }
}
