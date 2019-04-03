import 'package:flutter/material.dart';


import './products.dart';
import './product_control.dart';

class ProductManager extends StatelessWidget{

  final List<Map> products;


  ProductManager(this.products);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: <Widget>[
      Container(
        child: ProductControl(),
        margin: EdgeInsets.all(10.0),
      ),
      Expanded(child: Products(products))
    ],);
  }


}