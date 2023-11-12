import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class MobileNumberAuthenticationWidget extends StatefulWidget {
  @override
  _MobileNumberAuthenticationWidgetState createState() =>
      _MobileNumberAuthenticationWidgetState();
}

class _MobileNumberAuthenticationWidgetState
    extends State<MobileNumberAuthenticationWidget> {
  PhoneNumber number = PhoneNumber(isoCode: 'LY'); // Initial country

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InternationalPhoneNumberInput(
          onInputChanged: (PhoneNumber value) {
            setState(() {
              number = value;
            });
          },
          selectorConfig:const SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          ),
          initialValue: number, // Initial country
          textFieldController: TextEditingController(),

        ),
      ],
    );
  }
}
