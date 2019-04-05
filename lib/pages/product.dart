import 'package:flutter/material.dart';
import 'package:flutter_course/pages/home.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imgUrl;
  final double price;
  final String desc;

  ProductPage(this.title, this.imgUrl, this.price, this.desc);
    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return WillPopScope(onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      }, child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(imgUrl),
                Container(padding: EdgeInsets.all(10), child: Text(title)),
                Container(padding: EdgeInsets.all(10),
                    child: Text(
                        "Union Square, San Francisco | \$" + price.toString())),
                Container(padding: EdgeInsets.all(10), child: Text(desc)),
                RaisedButton(
                    color: Theme
                        .of(context)
                        .accentColor,
                    onPressed: () {
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          title: Text("Are you sure you want to delete?"),
                          content: Text("This cannot be undone"),
                          actions: <Widget>[
                            FlatButton(child: (Text("YES")), onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context, true);
                            },), FlatButton(child: (Text("NO")), onPressed: () {
                              Navigator.pop(context);
                            },)
                          ],);
                      });
                    }, child: Text('DELETE')),

              ])))
      );
    }
  }
