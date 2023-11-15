import 'package:clothes_store/config/componets/colors.dart';
import 'package:clothes_store/presentation/views/mainscreens/homeScreen.dart';
import 'package:clothes_store/presentation/views/mainscreens/orderScreen.dart';
import 'package:clothes_store/presentation/views/mainscreens/profileScreen.dart';
import 'package:clothes_store/presentation/views/mainscreens/searchScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';

import '../../../config/componets/icons.dart';
import '../../../controlers/cubit_for_navbar/navigation_cubit.dart';
import '../../../generated/l10n.dart';

class Navigation_Bar extends StatelessWidget {
  final List Screens = [
    HomeScreen(),
    SearchScreen(),
    OrderScreen(),
   const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var _Localaization= S.of(context);

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
                  const EdgeInsets.only(bottom: 0, left: 4, right: 4),
              child: GNav(
                  backgroundColor: Colors.white,
                  gap: 10,
                  activeColor: Colors.black,
                  iconSize: 25,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: primaryColor,
                  color: Colors.black,
                  tabs: [
                    GButton(
                      icon: UniconsLine.home_alt,
                      text:_Localaization.Home,
                    ),
                    GButton(
                      icon: UniconsLine.search,
                      text:_Localaization.Search,
                    ),
                    GButton(
                      icon: UniconsLine.shopping_cart,
                      text: _Localaization.Orders
                    ),
                    GButton(
                      icon: UniconsLine.user,
                      text: _Localaization.Profile
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
