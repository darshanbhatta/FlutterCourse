import 'package:flutter/material.dart';
import 'package:flutter_course/pages/product_create.dart';

class ProductListPage extends StatelessWidget {
  Function addProduct;
  Function deleteProduct;
  List products;
  Function updateProduct;

  ProductListPage(
      this.addProduct, this.deleteProduct, this.products, this.updateProduct);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        var assetImage = AssetImage(products[index]['image']);
        var image = new Image(
          image: assetImage,
          height: 96.0,
          width: 96.0,
          fit: BoxFit.fitWidth,
        );

        return Dismissible(
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
              child: Row(children: <Widget>[Icon(Icons.delete, color: Colors.white),Text('Delete Product',style: TextStyle(color: Colors.white))],mainAxisAlignment: MainAxisAlignment.end),
            padding: EdgeInsets.only(right: 10),
          ),
          key: Key(products[index]['title']),
          onDismissed: (DismissDirection dir) {
            if (dir == DismissDirection.endToStart) {
              deleteProduct(index);
            }
          },
          child: Column(children: <Widget>[
            Container(
                child: ListTile(
              leading: CircleAvatar(backgroundImage: assetImage),
              title: Text(products[index]['title']),
              trailing: Icon(Icons.edit),
              subtitle: Text('\$${products[index]['price'].toString()}'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ProductCreatePage(
                    addProduct,
                    deleteProduct,
                    product: products,
                    indx: index,
                    updateProduct: updateProduct,
                  );
                }));
              },
            )),
            Divider(
            )
          ]),
        );
      },
      itemCount: products.length,
    );
  }
}
