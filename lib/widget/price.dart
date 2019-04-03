import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget{
  double price;
  PriceTag(this.price);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2.5),
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        "\$" + price.toString(),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

}