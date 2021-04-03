import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/exceptions/http_exception.dart';
import 'package:shop/providers/products.dart';

import '../utils/app_routes.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.title),
      trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.PRODUCT_FORM,
                    arguments: product,
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () {
                  return showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text('Excluir produto'),
                      content: Text('Deseja excluir o produto?'),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () => Navigator.of(ctx).pop(false),
                          child: Text('Não'),
                        ),
                        FlatButton(
                          onPressed: () => Navigator.of(ctx).pop(true),
                          child: Text('Sim'),
                        ),
                      ],
                    ),
                  ).then((value) async {
                    if (value == true) {
                      try {
                        await Provider.of<Products>(context, listen: false)
                            .deleteProducts(product.id);
                      } on HttpException catch (error) {
                        print('Http Exception :-)');
                        scaffold.showSnackBar(SnackBar(
                          content: Text(error.toString()),
                        ));
                        // print(error.toString());
                      }
                    }
                  });
                },
              ),
            ],
          )),
    );
  }
}
