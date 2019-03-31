import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductCreatePage();
  }
}

class _ProductCreatePage extends State<ProductCreatePage> {
  String title = '';
  String description = '';
  double price;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        TextField(
          onChanged: (String value) {
            setState(() {
              title = value;
            });
          },
        ),
        TextField(
          maxLines: 4,
          onChanged: (String value) {
            setState(() {
              description = value;
            });
          },
        ),
        TextField(
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            setState(() {
              price = double.parse(value);
            });
          },
        )
      ],
    );
  }
}
