import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controlers/languse/languge_cubit.dart';

class ToggleSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = context.select((LanguageCubit cubit) => cubit.state.locale == Locale('ar', 'AR'));

    return Switch(
      value: isSwitched,
      onChanged: (_) {
        context.read<LanguageCubit>().changeLanguage(isSwitched ? Locale('en', 'US') : Locale('ar', 'AR'));
      },
      activeColor: Colors.green, // Customize the active color
      activeTrackColor: Colors.lightGreenAccent, // Customize the active track color
      inactiveThumbColor: Colors.grey, // Customize the inactive thumb color
      inactiveTrackColor: Colors.grey.withOpacity(0.5), // Customize the inactive track color
    );
  }
}