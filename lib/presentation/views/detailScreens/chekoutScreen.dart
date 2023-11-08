import 'package:clothes_store/config/componets/colors.dart';
import 'package:clothes_store/config/componets/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../config/componets/icons.dart';
import '../../wedgets/detaileScreenWedget/CheckOutWidget.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "CheckOut",
          style: TextStyle(
              fontFamily: primaryFont.fontFamily,
              fontSize: 20,
              color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
      ),
      body: Column(
        children: [
          ShippingAdress(),
          Container(
            height: 55,
            width: 400,
            color: primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(VisaIco),
                Text(
                  "Payment Method",
                  style: TextStyle(
                      fontFamily: primaryFont.fontFamily,
                      fontSize: 20,
                      color: Colors.black),
                ),
                GestureDetector(
                    onTap: () {
                      showPaymentSuccessDialog();
                    },
                    child: SvgPicture.asset(VisaIco)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> showPaymentSuccessDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Payment Successful'),
          content: Text('Your payment has been processed successfully.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
