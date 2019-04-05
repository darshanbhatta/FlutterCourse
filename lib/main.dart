import 'package:flutter/material.dart';
import 'package:flutter_course/pages/auth.dart';
import 'package:flutter_course/pages/home.dart';
import 'package:flutter_course/pages/manage.dart';
import 'package:flutter_course/pages/product.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {





  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  List<Map> _products = [];

  void _addProduct(Map product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }



  void _updateProduct(int index,Map product) {
    setState(() {
      _products[index] = product;
    });
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: AuthPage(_products),
        routes: {
          '/admin': ((context) {
            return ManageProduct(_addProduct,_deleteProduct, _products,_updateProduct);
          }),
          '/home': (context) {
            return HomePage(_products);
          }
        }, onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');
          print(pathElements);
          if(pathElements[0] != ''){
            return null;
          }
          if(pathElements[1]== 'product'){
            final int index = int.parse(pathElements[2]);
            print(index);
            return MaterialPageRoute<bool>(builder: (BuildContext context) {
              return ProductPage(
                  _products[index]['title'], _products[index]['image'],_products[index]['price'],_products[index]['desc']);
            });


          }
          return null;
        },
      onUnknownRoute: (RouteSettings settings){
        return MaterialPageRoute(builder: (BuildContext context){ return HomePage(_products);});
      },
    );}
}
