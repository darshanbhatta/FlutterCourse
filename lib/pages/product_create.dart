import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  Function addProduct;
  Function deleteProduct;

  ProductCreatePage(this.addProduct, this.deleteProduct);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductCreatePage(addProduct, deleteProduct);
  }
}

class _ProductCreatePage extends State<ProductCreatePage> {
  String title = '';
  String description = '';
  double price;

  Function addProduct;
  Function deleteProduct;

  _ProductCreatePage(this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Product title',
              ),
              onChanged: (String value) {
                setState(() {
                  title = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Product description',
              ),
              maxLines: 4,
              onChanged: (String value) {
                setState(() {
                  description = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Product price',
              ),
              keyboardType: TextInputType.number,
              onChanged: (String value) {
                setState(() {
                  price = double.parse(value);
                });
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              child: Text('Save'),
              onPressed: () {
                addProduct({
                  'title': title,
                  'image': 'assets/food.jpg',
                  'price': price,
                  'desc': description
                });
                Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('added item'),
                    duration: Duration(seconds: 2)));
                Navigator.pushReplacementNamed(context, '/home');
              },
            )
          ],
        ));
  }
}
