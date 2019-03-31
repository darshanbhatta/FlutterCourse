import 'package:flutter/material.dart';
import 'package:flutter_course/pages/manage.dart';
import 'package:flutter_course/product_manager.dart';

class HomePage extends StatelessWidget {
  final Function _addProduct;
  final Function _deleteProduct;
  final List<Map> _product;
  HomePage(this._addProduct,this._deleteProduct,this._product);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(title: Text("Choose"), automaticallyImplyLeading: false,),
              ListTile(
                title: Text('Manage Products'),
                onTap: () {Navigator.pushReplacementNamed(context, '/admin');})

            ],
          ),
        ),
        appBar: AppBar(
          title: Text('EasyList'),
        ),
        body: ProductManager(_product,_addProduct,_deleteProduct));
  }
}
