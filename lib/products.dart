import 'package:flutter/material.dart';
import 'package:flutter_course/widget/price.dart';

class Products extends StatelessWidget {
  final List<Map> products;

  Products(this.products);

  Widget _buildProducts(BuildContext context, int index) {
    return Card(
        child: Column(children: <Widget>[
      Image.asset(products[index]['image']),
      SizedBox(
        height: 10.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(products[index]['title'],
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            width: 10,
          ),
         PriceTag(products[index]['price']),
        ],
      ),
      SizedBox(
        height: 8,
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2.5),
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).accentColor),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          "Union Sqaure, San Francisco",
        ),
      ),
      ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
        IconButton(
          icon: Icon(Icons.info),
          color: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.pushNamed<bool>(context, '/product/' + index.toString())
                .then((bool onValue) {
              if (onValue) {}
            });
          },
        ),
        IconButton(icon: Icon(Icons.favorite_border) , color: Colors.red, onPressed: () {}),
      ])
    ]));
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
