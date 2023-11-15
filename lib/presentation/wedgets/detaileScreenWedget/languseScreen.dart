import 'package:clothes_store/presentation/views/mainscreens/profileScreen.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../views/mainscreens/NavBar.dart';
import '../mainScreenWedgit/profileScreenWidget.dart';

class Languge extends StatefulWidget {
  const Languge({super.key});

  @override
  State<Languge> createState() => _LangugeState();
}

class _LangugeState extends State<Languge> {

  @override
  Widget build(BuildContext context) {
    var _localization = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_localization.Language),
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) =>  Navigation_Bar(),
              ),
                  (route) => false,

            );
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(child: ToggleSwitch()),
    );
  }
}
