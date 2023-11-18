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
    var _Localaization = S.of(context);

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
            bottomNavigationBar: Container(
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                selectedIconTheme: IconThemeData(color: primaryColor),
                unselectedIconTheme: IconThemeData(color: Colors.grey),
                iconSize: 25,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(LineIcons.home),
                    label: _Localaization.Home,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(LineIcons.search),
                    label: _Localaization.Search,
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(LineIcons.shoppingCart),
                      label: _Localaization.Orders),
                  BottomNavigationBarItem(
                    icon: Icon(LineIcons.user),
                    label: _Localaization.Profile,
                  ),
                ],
                currentIndex: _currentIndex,
                onTap: (index) {
                  context.read<NavigationCubit>().changeIndex(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
