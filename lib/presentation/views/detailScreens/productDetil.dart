import 'package:clothes_store/config/componets/colors.dart';
import 'package:clothes_store/models/productmodel.dart';
import 'package:clothes_store/presentation/wedgets/sharedWedgets/coustomButtom.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../config/componets/Lists.dart';
import '../../../generated/l10n.dart';


class ProductDetail extends StatelessWidget {
  final Products product;

  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _localization = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_localization.ProductDetail),
      ),
      body: Column(
        children: [
          Container(
              color: Colors.white,
              height: 300,
              width: double.infinity,
              child: Image.asset(product.image!)),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 8),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name!).text.size(24).make(),
                    25.heightBox,
                    Text(product.description!)
                        .text
                        .size(18)
                        .color(Colors.brown)
                        .make(),
                    Text("${product.price}").text.size(19).make(),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CostumButtom(text: "Add To Cart", onPressed: (){
              cartProducts.add(product);
              context.showToast(msg: "Added To Cart");
            }, width: MediaQuery.of(context).size.width*0.1, height: MediaQuery.of(context).size.height*0.067, color: primaryColor, textColor: Colors.white, radius: 13, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
