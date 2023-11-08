import 'package:flutter/material.dart';

class OTPTextField extends StatefulWidget {
  final int length;
  final ValueChanged<String> onSubmitted;

  OTPTextField({required this.length, required this.onSubmitted});

  @override
  _OTPTextFieldState createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextField> {
  List<FocusNode> focusNodes =
      List<FocusNode>.generate(6, (index) => FocusNode());
  List<TextEditingController> controllers =
      List<TextEditingController>.generate(
          6, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.length,
        (index) {
          return Container(
            width: 55.0,
            margin:const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  if (index < widget.length - 1) {
                    focusNodes[index].unfocus();
                    FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                  } else {
                    focusNodes[index].unfocus();
                  }
                }
                onOTPChanged();
              },
              onSubmitted: (value) {
                if (index < widget.length - 1) {
                  focusNodes[index].unfocus();
                  FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                } else {
                  focusNodes[index].unfocus();
                }
              },
            ),
          );
        },
      ),
    );
  }

  void onOTPChanged() {
    String otp = '';
    for (int i = 0; i < widget.length; i++) {
      otp += controllers[i].text;
    }
    widget.onSubmitted(otp);
  }

  @override
  void dispose() {
    for (int i = 0; i < widget.length; i++) {
      focusNodes[i].dispose();
      controllers[i].dispose();
    }
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title:const Text("OTP Text Field Example"),
      ),
      body: Center(
        child: OTPTextField(
          length: 6, // Change this to the desired OTP length
          onSubmitted: (otp) {
            print("OTP entered: $otp");
          },
        ),
      ),
    ),
  ));
}
