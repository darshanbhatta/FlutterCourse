import 'package:flutter/material.dart';
import 'package:flutter_course/pages/home.dart';
import 'package:flutter_course/pages/product_create.dart';
import 'package:flutter_course/pages/product_list.dart';

class ManageProduct extends StatelessWidget {

  Function addProduct;
  Function deleteProduct;
  List products;
  Function updateProduct;

  ManageProduct(this.addProduct,this.deleteProduct,this.products,this.updateProduct);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(length: 2, child: Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(title: Text("Choose"), automaticallyImplyLeading: false,),
            ListTile(
              leading: Icon(Icons.shop),
              title: Text('All Products'),
              onTap: () {
               Navigator.pushReplacementNamed(context, '/home');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
          title: Text('Manage Product'),
          bottom: TabBar(tabs: <Widget>[
            Tab(text: 'Create Product', icon: Icon(Icons.create),), Tab(text: 'My Products',icon: Icon(Icons.list),)],)
      ),
      body: TabBarView(children: <Widget>[
        ProductCreatePage(addProduct,deleteProduct),ProductListPage(addProduct,deleteProduct,products,updateProduct)
      ]),));
  }
}
