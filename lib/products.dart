import 'package:flutter/material.dart';
import 'package:flutter_course/pages/product.dart';

class Products extends StatelessWidget {
  final List<Map> products;

  Products(this.products);

  Widget _buildProducts(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text(
                  'Details',
                ),
                onPressed: () {
                  Navigator.pushNamed<bool>(context, '/product/' + index.toString()).then((bool onValue){if(onValue){}});
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
    return products.length > 0
        ? ListView.builder(
            itemBuilder: _buildProducts,
            itemCount: products.length,
          )
        : Center(child: Text('No product found please add some'));
  }
}
