import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  Function addProduct;
  Function deleteProduct;
  List product;
  Function updateProduct;
  int indx;

  ProductCreatePage(this.addProduct, this.deleteProduct,
      {this.product, this.updateProduct, this.indx});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductCreatePage(addProduct, deleteProduct, product: product,indx: indx,updateProduct: updateProduct);
  }
}

class _ProductCreatePage extends State<ProductCreatePage> {
  String title = '';
  String description = '';
  double price;
  List product;
  Function updateProduct;
  Function addProduct;
  Function deleteProduct;
  int indx;

  final GlobalKey<FormState> _formstate = GlobalKey();

  _ProductCreatePage(this.addProduct, this.deleteProduct,
      {this.product, this.updateProduct, this.indx});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Widget pageContent = GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
            margin: EdgeInsets.all(10.0),
            child: Form(
                key: _formstate,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      initialValue:
                          product == null ? '' : product[indx]['title'],
                      decoration: InputDecoration(
                        labelText: 'Product title',
                      ),
                      onSaved: (String value) {
                        title = value;
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Title is required';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Product description',
                      ),
                      maxLines: 4,
                      initialValue:
                          product == null ? '' : product[indx]['desc'],
                      onSaved: (String value) {
                        description = value;
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Description is required';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      initialValue:
                          product == null ? '' : product[indx]['price'].toString(),
                      decoration: InputDecoration(
                        labelText: 'Product price',
                      ),
                      keyboardType: TextInputType.number,
                      onSaved: (String value) {
                        price = double.parse(value);
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Price is required';
                        }

                        try {
                          double.parse(value);
                          return null;
                        } catch (e) {
                          return 'Price has to be a number';
                        }
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
                        if (!_formstate.currentState.validate()) {
                          return;
                        }
                        _formstate.currentState.save();
                        if(product==null){
                          addProduct({
                            'title': title,
                            'image': 'assets/food.jpg',
                            'price': price,
                            'desc': description
                          });
                        }else{
                          updateProduct(indx,{
                            'title': title,
                            'image': 'assets/food.jpg',
                            'price': price,
                            'desc': description
                          });
                        }


                        Navigator.pushReplacementNamed(context, '/home');
                      },
                    )
                  ],
                ))));

  if(product == null){
    print('running');
    return pageContent;
  }else{
    print('hmmmm');

    return  new Scaffold(
      appBar: AppBar(
        title: (Text('Edit Product')),
      ),
      body: pageContent,
    );
  }

  }
}
