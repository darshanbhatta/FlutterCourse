import 'package:flutter/material.dart';


import './products.dart';
import './product_control.dart';

class ProductManager extends StatefulWidget{
  final String startingProduct;
  ProductManager(this.startingProduct);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductManager();
  }




}


class _ProductManager extends State<ProductManager> {
  List<String> _products = [];
  void _addProduct(String product) {
    setState(() {
      _products.add(product);
    });
  }
  @override
  void initState() {
    _products.add(widget.startingProduct);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: <Widget>[
      Container(
        child: ProductControl(_addProduct),
        margin: EdgeInsets.all(10.0),
      ),
      Products(_products)
    ],);
  }


}