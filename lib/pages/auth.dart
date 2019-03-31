import 'package:flutter/material.dart';
import 'package:flutter_course/pages/home.dart';
import 'package:flutter_course/product_manager.dart';
import 'package:flutter_course/products.dart';

class AuthPage extends StatefulWidget {
  List products;

  AuthPage(this.products);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AuthPage(products);
  }
}

class _AuthPage extends State<AuthPage> {
  List products;
  bool _acceptTerms = false;

  _AuthPage(this.products);

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
            margin: EdgeInsets.all(10.0),
            child: Column(children: <Widget>[
              TextField(
                onChanged: (String value) {
                  email = value;
                },
                decoration: InputDecoration(labelText: "Email"),
              ),
              TextField(
                onChanged: (String value) {
                  password = value;
                },
                decoration: InputDecoration(labelText: "Password"),
              ),
              SwitchListTile(
                value: _acceptTerms,
                onChanged: (bool value) {
                  setState(() {
                    _acceptTerms = value;
                    print(value);

                  });
                },
                title: Text("Accept terms"),
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                  child: Text('Login'),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return HomePage(products);
                    }));
                  })
            ])));
  }
}
