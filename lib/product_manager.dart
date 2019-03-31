import 'package:flutter/material.dart';


import './products.dart';
import './product_control.dart';

class ProductManager extends StatelessWidget{

  final List<Map> products;
  final Function addProduct;
  final Function deleteProduct;

  ProductManager(this.products,this.addProduct,this.deleteProduct);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: <Widget>[
      Container(
        child: ProductControl(addProduct),
        margin: EdgeInsets.all(10.0),
      ),
      Expanded(child: Products(products,deleteProduct))
    ],);
  }


}