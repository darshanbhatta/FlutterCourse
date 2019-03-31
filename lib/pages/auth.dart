import 'package:flutter/material.dart';
import 'package:flutter_course/pages/home.dart';
import 'package:flutter_course/product_manager.dart';
import 'package:flutter_course/products.dart';

class AuthPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return   Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
    //    body: Center(child: RaisedButton(child: Text('Login'),onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return HomePage();}));},),)
    );;
  }

}