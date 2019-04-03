import 'package:flutter/material.dart';
import 'package:flutter_course/product_manager.dart';

class HomePage extends StatelessWidget {
  final List<Map> product;

  HomePage(this.product);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                title: Text("Choose"),
                automaticallyImplyLeading: false,
              ),
              ListTile(
                  leading: Icon(Icons.edit),
                  title: Text('Manage Products'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/admin');
                  })
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('EasyList'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite),
              color: Colors.white,
              onPressed: () {},
            )
          ],
        ),
        body: ProductManager(product));
  }
}
