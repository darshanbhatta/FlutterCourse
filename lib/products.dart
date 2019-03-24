import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> _products;
  Products(this._products);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _products
          .map(
            (elements) => Card(
          child: Column(
            children: <Widget>[
              Container(
                child: Image.asset('assets/food.jpg'),
                margin: EdgeInsets.all(20),
              ),
              Text(elements),
            ],
          ),
        ),
      )
          .toList(),
    );
  }

}