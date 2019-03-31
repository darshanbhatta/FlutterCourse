import 'package:flutter/material.dart';
import 'package:flutter_course/pages/product.dart';

class Products extends StatelessWidget {
  final List<Map> _products;
  final Function deleteproduct;
  Products(this._products,this.deleteproduct);

  Widget _buildProducts(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(_products[index]['image']),
          Text(_products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text(
                  'Details',
                ),
                onPressed: () {
                  Navigator.pushNamed<bool>(context, '/product/' + index.toString()).then((bool onValue){if(onValue){deleteproduct(index);}});
                },
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _products.length > 0
        ? ListView.builder(
            itemBuilder: _buildProducts,
            itemCount: _products.length,
          )
        : Center(child: Text('No product found please add some'));
  }
}
